import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:approyal/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/foundation.dart';

@immutable
class CloudDetail {
  final String documentId;
  final String orderId;
  final String productId;
  final double cantidad;
  final double totalproducto;

  const CloudDetail({
    required this.documentId,
    required this.orderId,
    required this.productId,
    required this.cantidad,
    required this.totalproducto,
  });

  CloudDetail.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        orderId = snapshot.data()[detailOrderIdField] as String,
        productId = snapshot.data()[detailOrderIdField] as String,
        cantidad = snapshot.data()[detailQuantityField] as double,
        totalproducto = snapshot.data()[detailTotalProductCost] as double;
}
