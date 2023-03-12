import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:approyal/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/foundation.dart';

@immutable
class CloudOrder {
  final String documentId;
  final String userId;
  final DateTime fechaemision;
  final double preciocompra;
  final double iva;
  final double preciototal;
  final double comision;
  final String nombrecliente;
  final String apellidocliente;
  final String tipopago;

  const CloudOrder({
    required this.documentId,
    required this.userId,
    required this.fechaemision,
    required this.preciocompra,
    required this.iva,
    required this.preciototal,
    required this.comision,
    required this.nombrecliente,
    required this.apellidocliente,
    required this.tipopago,
  });

  CloudOrder.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        userId = snapshot.data()[orderUserId] as String,
        fechaemision = snapshot.data()[orderDateField] as DateTime,
        preciocompra = snapshot.data()[orderPrecioCompraField] as double,
        iva = snapshot.data()[orderIvaField] as double,
        preciototal = snapshot.data()[orderPrecioTotal] as double,
        comision = snapshot.data()[orderComision] as double,
        nombrecliente = snapshot.data()[orderNombreCliente] as String,
        apellidocliente = snapshot.data()[orderApellidoCliente] as String,
        tipopago = snapshot.data()[orderTipopago] as String;
}
