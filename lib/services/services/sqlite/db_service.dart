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

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpen();
    } else {
      return db;
    }
  }

// Crud for Orden

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

    return DatabaseOrder(
        id: orderId,
        userId: order.userId,
        preciocompra: order.preciocompra,
        iva: order.iva,
        preciototal: order.preciototal,
        nombrecliente: order.nombrecliente,
        apellidocliente: order.apellidocliente,
        tipopago: order.tipopago,
        isSyncedWithCloud: order.isSyncedWithCloud);
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
      return await getProduct(productId: productId);
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
      return DatabaseProducts.fromRow(results.first);
    }
  }

  Future<void> deleteProduct({required int productId}) async {
    final db = _getDatabaseOrThrow();
    final deletedproduct = await db.delete(
      userTable,
      where: 'productId = ?',
      whereArgs: [productId],
    );
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

    return DatabaseProducts(
        id: productId,
        name: product.name,
        description: product.description,
        price: product.price,
        category: product.category,
        picture: product.picture,
        frecuency: product.frecuency,
        isSyncedWithCloud: product.isSyncedWithCloud);
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
