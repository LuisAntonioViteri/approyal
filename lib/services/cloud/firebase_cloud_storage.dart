import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:approyal/services/cloud/cloud_product.dart';
import 'package:approyal/services/cloud/cloud_storage_constants.dart';
import 'package:approyal/services/cloud/cloud_storage_exception.dart';
import 'package:flutter/material.dart';

class FirebaseCloudStorage {
  final products = FirebaseFirestore.instance.collection('products');
  final orders = FirebaseFirestore.instance.collection('Order');
  final detail = FirebaseFirestore.instance.collection('products');

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
