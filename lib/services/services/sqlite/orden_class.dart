import 'constants.dart';

class DatabaseOrder {
  final int id;
  final int userId;
  final double preciocompra;
  final double iva;
  final double preciototal;
  final String nombrecliente;
  final String apellidocliente;
  final String tipopago;
  final bool isSyncedWithCloud;

  DatabaseOrder({
    required this.id,
    required this.userId,
    required this.preciocompra,
    required this.iva,
    required this.preciototal,
    required this.nombrecliente,
    required this.apellidocliente,
    required this.tipopago,
    required this.isSyncedWithCloud,
  });

  DatabaseOrder.fromRow(Map<String, Object?> map)
      : id = map[orderIdColumn] as int,
        userId = map[idColumn] as int,
        preciocompra = map[precioCompraColumn] as double,
        iva = map[ivaColumn] as double,
        preciototal = map[precioTotalColumn] as double,
        nombrecliente = map[nombreClienteColumn] as String,
        apellidocliente = map[apellidoClienteColumn] as String,
        tipopago = map[tipoPagoColumn] as String,
        isSyncedWithCloud =
            (map[isSyncedWithCloudColumn] as int) == 1 ? true : false;

  @override
  String toString() =>
      'Orden, ID = $id, userId = $userId, precio compra = $preciocompra, iva=$iva, precio total=$preciototal, nombre =$nombrecliente, apellido = $apellidocliente, tipo de pago = $tipopago';

  @override
  bool operator ==(covariant DatabaseOrder other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}
