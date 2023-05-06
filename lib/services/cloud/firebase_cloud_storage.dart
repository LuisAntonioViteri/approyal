import 'package:approyal/services/cloud/cloud_detail.dart';
import 'package:approyal/services/cloud/cloud_order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:approyal/services/cloud/cloud_product.dart';
import 'package:approyal/services/cloud/cloud_storage_constants.dart';
import 'package:approyal/services/cloud/cloud_storage_exception.dart';

class FirebaseCloudStorage {
  final products = FirebaseFirestore.instance.collection('Productos');
  //final images = FirebaseStorage.instance.ref('ProductImages');
  final orders = FirebaseFirestore.instance.collection('order');
  final detail = FirebaseFirestore.instance.collection('detail');

//OrderDetail

  Stream<Iterable<CloudDetail>> allOrderDetailbyOrder(
      {required String orderId}) {
    final alldetail = detail
        .where(detailOrderIdField, isEqualTo: orderId)
        .snapshots()
        .map((event) => event.docs.map((doc) => CloudDetail.fromSnapshot(doc)));
    return alldetail;
  }

  Future<void> deleteOrderDetail({required String documentId}) async {
    try {
      await detail.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteProductException();
    }
  }

  Future<void> updateOrderDetail({required CloudDetail detalle}) async {
    try {
      await products.doc(detalle.documentId).update({
        detailOrderIdField: detalle.orderId,
        detailProductIdField: detalle.productId,
        detailQuantityField: detalle.cantidad,
        detailTotalProductCost: detalle.totalproducto,
      });
    } catch (e) {
      throw CouldNotUpdateProductException();
    }
  }

  Future<void> createNewOrderDetail({
    required CloudDetail detalle,
  }) async {
    try {
      await detail.add({
        detailOrderIdField: detalle.orderId,
        detailProductIdField: detalle.productId,
        detailQuantityField: detalle.cantidad,
        detailTotalProductCost: detalle.totalproducto,
      });
    } catch (e) {
      CouldNotCreateProductException();
    }
  }

  //Ordenes

  Stream<Iterable<CloudOrder>> allOrdersbyuser({required String userId}) {
    final allorders = orders
        .where(orderUserId, isEqualTo: userId)
        .snapshots()
        .map((event) => event.docs.map((doc) => CloudOrder.fromSnapshot(doc)));
    return allorders;
  }

  Future<void> deleteOrder({required String documentId}) async {
    try {
      await orders.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteProductException();
    }
  }

  Future<void> updateOrder({required CloudOrder orden}) async {
    try {
      await products.doc(orden.documentId).update({
        orderDateField: orden.fechaemision,
        orderIvaField: orden.iva,
        orderPrecioCompraField: orden.preciocompra,
        orderPrecioTotal: orden.preciototal,
        orderComision: orden.comision,
        orderNombreCliente: orden.nombrecliente,
        orderApellidoCliente: orden.apellidocliente,
        orderTipopago: orden.tipopago,
      });
    } catch (e) {
      throw CouldNotUpdateProductException();
    }
  }

  Future<void> createNewOrder(
      {required CloudOrder orden, required String documentId}) async {
    try {
      await orders.add({
        orderUserId: documentId,
        orderDateField: orden.fechaemision,
        orderIvaField: orden.iva,
        orderPrecioCompraField: orden.preciocompra,
        orderPrecioTotal: orden.preciototal,
        orderComision: orden.comision,
        orderNombreCliente: orden.nombrecliente,
        orderApellidoCliente: orden.apellidocliente,
        orderTipopago: orden.tipopago,
      });
    } catch (e) {
      CouldNotCreateProductException();
    }
  }

  //Productos

  Future<void> deleteProduct({required String documentId}) async {
    try {
      await products.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteProductException();
    }
  }

  Future<void> updateProduct({required CloudProduct product}) async {
    try {
      await products.doc(product.documentId).update({
        productCodeField: product.code,
        productNameField: product.name,
        productDescriptionField: product.description,
        productPriceField: product.price,
        productCategoryField: product.category,
        productClasificationField: product.clasification,
        productImageField: product.picture,
      });
    } catch (e) {
      throw CouldNotUpdateProductException();
    }
  }

  Stream<Iterable<CloudProduct>> allproductsbyname(
      {required String productname}) {
    final allproducts = products
        .where(productNameField, isEqualTo: productname)
        .snapshots()
        .map(
            (event) => event.docs.map((doc) => CloudProduct.fromSnapshot(doc)));
    return allproducts;
  }

  Stream<Iterable<CloudProduct>> allproductsbycategory(
      {required String productcategory}) {
    final allproducts = products
        .where(productCategoryField, isEqualTo: productcategory)
        .snapshots()
        .map(
            (event) => event.docs.map((doc) => CloudProduct.fromSnapshot(doc)));
    return allproducts;
  }

  Stream<Iterable<CloudProduct>> allproducts() {
    final allproducts = products.snapshots().map(
        (event) => event.docs.map((doc) => CloudProduct.fromSnapshot(doc)));
    return allproducts;
  }

  Future<void> createNewProduct({required CloudProduct producto}) async {
    try {
      await products.add({
        productCodeField: producto.code,
        productNameField: producto.name,
        productDescriptionField: producto.description,
        productPriceField: producto.price,
        productCategoryField: producto.category,
        productClasificationField: producto.clasification,
        productImageField: producto.picture,
        productFrecuency: producto.frecuency
      });
    } catch (e) {
      CouldNotCreateProductException();
    }
  }

  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInstance();
  FirebaseCloudStorage._sharedInstance();
  factory FirebaseCloudStorage() => _shared;
}
