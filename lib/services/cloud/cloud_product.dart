import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:approyal/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/foundation.dart';

@immutable
class CloudProduct {
  final String documentId;
  final String code;
  final String name;
  final String description;
  final double price;
  final String category;
  final String clasification;
  final Uint8List picture;
  final int frecuency;

  const CloudProduct({
    required this.documentId,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.clasification,
    required this.picture,
    required this.frecuency,
  });

  CloudProduct.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        code = snapshot.data()[productCodeField] as String,
        name = snapshot.data()[productNameField] as String,
        description = snapshot.data()[productDescriptionField] as String,
        price = snapshot.data()[productPriceField] as double,
        category = snapshot.data()[productCategoryField] as String,
        clasification = snapshot.data()[productClasificationField] as String,
        picture = snapshot.data()[productImageField] as Uint8List,
        frecuency = snapshot.data()[productFrecuency] as int;
}
