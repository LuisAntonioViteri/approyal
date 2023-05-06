import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:approyal/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/foundation.dart';

@immutable
class CloudDetallesPago {
  final String documentId;
  final String metododepagoId;
  final String orderId;
  final double preciocompra;
  final double iva;
  final double preciototal;
  final double agregado;
  final double entrada;
  final double saldofinanciado;
  final double interes;
  final int cantidadpagos;
  final double montocuotas;

  const CloudDetallesPago({
    required this.documentId,
    required this.metododepagoId,
    required this.orderId,
    required this.preciocompra,
    required this.iva,
    required this.preciototal,
    required this.agregado,
    required this.entrada,
    required this.saldofinanciado,
    required this.interes,
    required this.cantidadpagos,
    required this.montocuotas,
  });

  CloudDetallesPago.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        metododepagoId = snapshot.data()[pagometodoIdField] as String,
        orderId = snapshot.data()[pagoorderIdField] as String,
        preciocompra = snapshot.data()[pagopreciocompraField] as double,
        iva = snapshot.data()[pagodetlleivaField] as double,
        preciototal = snapshot.data()[pagopreciocompraField] as double,
        agregado = snapshot.data()[pagoagregadoField] as double,
        entrada = snapshot.data()[pagoentradaField] as double,
        saldofinanciado = snapshot.data()[pagosaldofinanciadoField] as double,
        interes = snapshot.data()[pagointeresField] as double,
        cantidadpagos = snapshot.data()[pagocantidadcuotasField] as int,
        montocuotas = snapshot.data()[pagomontocuotasField] as double;
}
