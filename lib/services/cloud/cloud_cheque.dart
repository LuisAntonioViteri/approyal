import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:approyal/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/foundation.dart';

@immutable
class CloudCheque {
  final String documentId;
  final String orderId;
  final double interes;
  final int numcheques;

  const CloudCheque({
    required this.documentId,
    required this.orderId,
    required this.interes,
    required this.numcheques,
  });

  CloudCheque.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        orderId = snapshot.data()[chequeOrderIdField] as String,
        interes = snapshot.data()[chequeInteresField] as double,
        numcheques = snapshot.data()[chequesNumField] as int;
}
