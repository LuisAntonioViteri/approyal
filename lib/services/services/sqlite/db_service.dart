import 'dart:async';

import 'package:approyal/services/services/sqlite/detalleorden_class.dart';
import 'package:approyal/services/services/sqlite/orden_class.dart';
import 'package:approyal/services/services/sqlite/product_class.dart';
import 'package:approyal/services/services/sqlite/user_class.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'constants.dart';
import 'db_exceptions.dart';

class ProductService {
  Database? _db;

// Handling data on cache via StreamControllers

  List<DatabaseProducts> _products = [];
  List<DatabaseOrder> _orders = [];
  List<DatabaseDetalleOrden> _detalle = [];

  final _productsStreamController =
      StreamController<List<DatabaseProducts>>.broadcast();
  final _orderStreamController =
      StreamController<List<DatabaseOrder>>.broadcast();
  final _detalleStreamController =
      StreamController<List<DatabaseDetalleOrden>>.broadcast();

// Get or create user functions to connect service with views
  Future<DatabaseUser> getOrCreateUser({required String email}) async {
    try {
      final user = await getUser(email: email);
      return user;
    } on CouldNotFindUser {
      final createdUser = await createUser(email: email);
      return createdUser;
    } catch (e) {
      rethrow;
    }
  }

//Handling Detalle on cache

  Future<void> _cacheDetalle({required DatabaseOrder order}) async {
    final allDetalle = await getAllDetalleFromOrder(order: order);
    _detalle = allDetalle.toList();
    _detalleStreamController.add(_detalle);
  }

//Handling Orders on cache

  Future<void> _cacheOrders({required DatabaseUser user}) async {
    final allOrders = await getAllOrdersFromUser(owner: user);
    _orders = allOrders.toList();
    _orderStreamController.add(_orders);
  }

//Handling Products on cache

  Future<void> _cacheProducts() async {
    final allProducts = await getAllProducts();
    _products = allProducts.toList();
    _productsStreamController.add(_products);
  }

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpen();
    } else {
      return db;
    }
  }

// Crud for detalle

  Future<DatabaseDetalleOrden> updateDetalleOrder(
      {required int detalleId, required DatabaseDetalleOrden udetalle}) async {
    final db = _getDatabaseOrThrow();

    final updatesCount = await db.update(
      detalleTable,
      {
        orderIdColumn: udetalle.orderId,
        productIdColumn: udetalle.productId,
        cantidadColumn: udetalle.cantidad,
        totalProductoColumn: udetalle.totalproducto,
        isSyncedWithCloudColumn: 0,
      },
      where: 'detalleId = ?',
      whereArgs: [detalleId],
    );

    if (updatesCount == 0) {
      throw CouldNotUpdateDetalleOrden();
    } else {
      final updatedDetail = await getDetalle(id: detalleId);
      _detalle.removeWhere((detalle) => detalle.id == updatedDetail.id);
      _detalle.add(updatedDetail);
      _detalleStreamController.add(_detalle);
      return updatedDetail;
    }
  }

  Future<Iterable<DatabaseDetalleOrden>> getAllDetalleFromOrder(
      {required DatabaseOrder order}) async {
    final db = _getDatabaseOrThrow();

    final dbOrder = await getOrden(id: order.id);
    //Verify user
    if (dbOrder != order) {
      throw CouldNotFindOrder();
    }

    final orders = await db.query(
      detalleTable,
      where: 'orderId = ?',
      whereArgs: [order.id],
    );

    return orders.map((ordersRow) => DatabaseDetalleOrden.fromRow(ordersRow));
  }

  Future<DatabaseDetalleOrden> getDetalle({required int id}) async {
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      detalleTable,
      limit: 1,
      where: 'detalleId = ?',
      whereArgs: [id],
    );
    if (results.isEmpty) {
      throw CouldNotFindDetalleOrden();
    } else {
      final detalle = DatabaseDetalleOrden.fromRow(results.first);
      _detalle.removeWhere((detalles) => detalles.id == id);
      _detalle.add(detalle);
      _detalleStreamController.add(_detalle);
      return detalle;
    }
  }

  Future<void> deleteAllOrdenDetalle({required int orderId}) async {
    final db = _getDatabaseOrThrow();
    final deletedDetlles = await db.delete(
      detalleTable,
      where: 'orderId = ?',
      whereArgs: [orderId],
    );
    if (deletedDetlles == 0) {
      throw CouldNotDeleteOrder();
    } else {
      _detalle.removeWhere((detalle) => detalle.orderId == orderId);
      _detalleStreamController.add(_detalle);
    }
  }

  Future<void> deleteDetalle({required int id}) async {
    final db = _getDatabaseOrThrow();
    final deletedDetalle = await db.delete(
      detalleTable,
      where: 'detalleId = ?',
      whereArgs: [id],
    );
    if (deletedDetalle == 0) {
      throw CouldNotDeleteDetalleOrden();
    } else {
      _detalle.removeWhere((detalle) => detalle.id == id);
      _detalleStreamController.add(_detalle);
    }
  }

  Future<DatabaseDetalleOrden> createDetalle(
      {required DatabaseOrder order,
      required DatabaseDetalleOrden detalle}) async {
    final db = _getDatabaseOrThrow();

    //make sure  owner exist in the db with the correct id
    final dbOrder = await getOrden(id: order.id);
    if (dbOrder != order) {
      throw CouldNotFindDetalleOrden();
    }

    final results = await db.query(
      detalleTable,
      limit: 1,
      where: 'productId = ? AND orderId = ?',
      whereArgs: [detalle.productId, detalle.productId],
    );
    if (results.isNotEmpty) {
      throw DetalleOrdenAlreadyExist();
    }

    final detalleId = await db.insert(detalleTable, {
      orderIdColumn: detalle.orderId,
      productIdColumn: detalle.productId,
      cantidadColumn: detalle.cantidad,
      totalProductoColumn: detalle.totalproducto,
      isSyncedWithCloudColumn: detalle.isSyncedWithCloud,
    });

    final detalleReturn = DatabaseDetalleOrden(
        id: detalleId,
        orderId: detalle.orderId,
        productId: detalle.productId,
        cantidad: detalle.cantidad,
        totalproducto: detalle.totalproducto,
        isSyncedWithCloud: detalle.isSyncedWithCloud);

    _detalle.add(detalleReturn);
    _detalleStreamController.add(_detalle);

    return detalleReturn;
  }

// Crud for Orden

  Future<DatabaseOrder> updateOrder(
      {required int orderId, required DatabaseOrder uorder}) async {
    final db = _getDatabaseOrThrow();

    final updatesCount = await db.update(
      orderTable,
      {
        userIdColumn: uorder.userId,
        precioCompraColumn: uorder.preciocompra,
        ivaColumn: uorder.iva,
        precioTotalColumn: uorder.preciototal,
        nombreClienteColumn: uorder.nombrecliente,
        apellidoClienteColumn: uorder.apellidocliente,
        tipoPagoColumn: uorder.tipopago,
        isSyncedWithCloudColumn: 0,
      },
      where: 'ordenId = ?',
      whereArgs: [orderId],
    );

    if (updatesCount == 0) {
      throw CouldNotUpdateProduct();
    } else {
      final updatedOrder = await getOrden(id: orderId);
      _orders.removeWhere((orden) => orden.id == updatedOrder.id);
      _orders.add(updatedOrder);
      _orderStreamController.add(_orders);
      return updatedOrder;
    }
  }

  Future<Iterable<DatabaseOrder>> getAllOrdersFromUser(
      {required DatabaseUser owner}) async {
    final db = _getDatabaseOrThrow();

    final dbUser = await getUser(email: owner.email);
    //Verify user
    if (dbUser != owner) {
      throw CouldNotFindUser();
    }

    final orders = await db.query(
      orderTable,
      where: 'userId = ?',
      whereArgs: [owner.id],
    );

    return orders.map((ordersRow) => DatabaseOrder.fromRow(ordersRow));
  }

  Future<DatabaseOrder> getOrden({required int id}) async {
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      productTable,
      limit: 1,
      where: 'ordenId = ?',
      whereArgs: [id],
    );
    if (results.isEmpty) {
      throw CouldNotFindOrder();
    } else {
      final order = DatabaseOrder.fromRow(results.first);
      _orders.removeWhere((orden) => orden.id == id);
      _orders.add(order);
      _orderStreamController.add(_orders);
      return order;
    }
  }

  Future<void> deleteOrder({required int id}) async {
    final db = _getDatabaseOrThrow();
    await deleteAllOrdenDetalle(orderId: id);
    final deletedOrder = await db.delete(
      orderTable,
      where: 'ordenId = ?',
      whereArgs: [id],
    );

    if (deletedOrder == 0) {
      throw CouldNotDeleteOrder();
    } else {
      _orders.removeWhere((order) => order.id == id);
      _orderStreamController.add(_orders);
    }
  }

  Future<DatabaseOrder> createOrder(
      {required DatabaseOrder order, required DatabaseUser owner}) async {
    final db = _getDatabaseOrThrow();

    //make sure  owner exist in the db with the correct id
    final dbUser = await getUser(email: owner.email);
    if (dbUser != owner) {
      throw CouldNotFindUser();
    }

    final results = await db.query(
      orderTable,
      limit: 1,
      where: 'ordenId = ?',
      whereArgs: [order.id],
    );
    if (results.isNotEmpty) {
      throw OrderAlreadyExist();
    }

    final orderId = await db.insert(productTable, {
      userIdColumn: order.userId,
      precioCompraColumn: order.preciocompra,
      ivaColumn: order.iva,
      precioTotalColumn: order.preciototal,
      nombreClienteColumn: order.nombrecliente,
      apellidoClienteColumn: order.apellidocliente,
      tipoPagoColumn: order.tipopago,
      isSyncedWithCloudColumn: order.isSyncedWithCloud,
    });

    final orderReturn = DatabaseOrder(
        id: orderId,
        userId: order.userId,
        preciocompra: order.preciocompra,
        iva: order.iva,
        preciototal: order.preciototal,
        nombrecliente: order.nombrecliente,
        apellidocliente: order.apellidocliente,
        tipopago: order.tipopago,
        isSyncedWithCloud: order.isSyncedWithCloud);

    _orders.add(orderReturn);
    _orderStreamController.add(_orders);

    return orderReturn;
  }

//Crud for ProductsTable

  Future<DatabaseProducts> updateProduct(
      {required int productId, required DatabaseProducts uproduct}) async {
    final db = _getDatabaseOrThrow();

    final updatesCount = await db.update(
      productTable,
      {
        nameColumn: uproduct.name,
        descriptionColumn: uproduct.description,
        priceColumn: uproduct.price,
        categoryColumn: uproduct.category,
        pictureColumn: uproduct.picture,
        frecuencyColumn: uproduct.frecuency,
        isSyncedWithCloudColumn: 0,
      },
      where: 'productId = ?',
      whereArgs: [productId],
    );

    if (updatesCount == 0) {
      throw CouldNotUpdateProduct();
    } else {
      final updatedProduct = await getProduct(productId: productId);
      _products.removeWhere((product) => product.id == updatedProduct.id);
      _products.add(updatedProduct);
      _productsStreamController.add(_products);
      return updatedProduct;
    }
  }

  Future<Iterable<DatabaseProducts>> getAllProducts() async {
    final db = _getDatabaseOrThrow();
    final products = await db.query(productTable);

    return products.map((productRow) => DatabaseProducts.fromRow(productRow));
  }

  Future<DatabaseProducts> getProduct({required int productId}) async {
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      productTable,
      limit: 1,
      where: 'productId = ?',
      whereArgs: [productId],
    );
    if (results.isEmpty) {
      throw CouldNotFindProduct();
    } else {
      final product = DatabaseProducts.fromRow(results.first);
      _products.removeWhere((product) => product.id == productId);
      _products.add(product);
      _productsStreamController.add(_products);
      return product;
    }
  }

  Future<void> deleteProduct({required int productId}) async {
    final db = _getDatabaseOrThrow();
    final deletedproduct = await db.delete(
      userTable,
      where: 'productId = ?',
      whereArgs: [productId],
    );
    if (deletedproduct == 0) {
      throw CouldNotDeleteProduct();
    } else {
      _products.removeWhere((product) => product.id == productId);
      _productsStreamController.add(_products);
    }
  }

  Future<DatabaseProducts> createProduct(
      {required DatabaseProducts product}) async {
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      productTable,
      limit: 1,
      where: 'productId = ?',
      whereArgs: [product.id],
    );
    if (results.isNotEmpty) {
      throw ProductAlreadyExists();
    }
    final productId = await db.insert(productTable, {
      nameColumn: product.name,
      descriptionColumn: product.description,
      priceColumn: product.price,
      categoryColumn: product.category,
      pictureColumn: product.picture,
      frecuencyColumn: product.frecuency,
      isSyncedWithCloudColumn: product.isSyncedWithCloud,
    });

    final productreturn = DatabaseProducts(
        id: productId,
        name: product.name,
        description: product.description,
        price: product.price,
        category: product.category,
        picture: product.picture,
        frecuency: product.frecuency,
        isSyncedWithCloud: product.isSyncedWithCloud);

    _products.add(productreturn);
    _productsStreamController.add(_products);

    return productreturn;
  }

//Crud for UserTable
  Future<DatabaseUser> getUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      userTable,
      limit: 1,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );

    if (results.isEmpty) {
      throw CouldNotFindUser();
    } else {
      return DatabaseUser.fromRow(results.first);
    }
  }

  Future<void> deleteUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final deletedAcount = await db.delete(
      userTable,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );
  }

  Future<DatabaseUser> createUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      userTable,
      limit: 1,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );

    if (results.isNotEmpty) {
      throw UserAlreadyExists();
    }
    final userId = await db.insert(userTable, {
      emailColumn: email.toLowerCase(),
    });

    return DatabaseUser(
      id: userId,
      email: email,
    );
  }

  Future<void> open() async {
    if (_db != null) {
      throw DatabaseAlreadyOpenException();
    }
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);
      _db = db;

      //create user table
      await db.execute(createUserTable);
      //create product table
      await db.execute(createProductTable);
      await _cacheProducts();
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectory();
    }
  }

  Future<void> close() async {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpen();
    } else {
      await db.close();
      _db = null;
    }
  }
}

const dbName = 'approyaldb.db';
const userTable = 'user';
const productTable = 'products';
const orderTable = 'order';
const detalleTable = 'detalleorden';

const createUserTable = ''' CREATE TABLE "user" (
        "userId"	INTEGER NOT NULL,
        "email"	TEXT NOT NULL UNIQUE,
        PRIMARY KEY("userId" AUTOINCREMENT));''';

const createProductTable = ''' CREATE TABLE "products" (
	"productId"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"description"	TEXT,
	"price"	REAL,
	"category"	TEXT NOT NULL UNIQUE,
	"picture"	BLOB,
	"frecuency"	INTEGER,
	"isSyncedWithCloud"	INTEGER,
	PRIMARY KEY("productId" AUTOINCREMENT)
);''';

const createOrdenTable = ''' CREATE TABLE "orden" (
	"ordenId"	INTEGER NOT NULL,
	"userId"	INTEGER NOT NULL,
	"preciocompra"	REAL,
	"iva"	REAL NOT NULL,
	"preciototal"	REAL,
	"nombrecliente"	TEXT NOT NULL,
	"apellidocliente"	TEXT NOT NULL,
	"tipopago"	TEXT NOT NULL,
	"isSyncedWithCloud"	INTEGER,
	PRIMARY KEY("ordenId" AUTOINCREMENT),
	FOREIGN KEY("userId") REFERENCES "user"("userId")
);''';

const createDetalleOrdenTable = '''CREATE TABLE "detalleorden" (
	"detalleId"	INTEGER NOT NULL UNIQUE,
	"orderId"	INTEGER NOT NULL,
	"productId"	INTEGER NOT NULL,
	"cantidad"	INTEGER NOT NULL,
	"totalproducto"	REAL,
	"isSyncedWithCloud"	INTEGER,
	PRIMARY KEY("detalleId" AUTOINCREMENT),
	FOREIGN KEY("productId") REFERENCES "products"("productId"),
	FOREIGN KEY("orderId") REFERENCES "orden"("ordenId")
); ''';
