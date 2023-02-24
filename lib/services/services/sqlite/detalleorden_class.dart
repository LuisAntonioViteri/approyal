import 'constants.dart';

class DatabaseDetalleOrden {
  final int id;
  final int orderId;
  final int productId;
  final double cantidad;
  final double totalproducto;
  final bool isSyncedWithCloud;

  DatabaseDetalleOrden({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.cantidad,
    required this.totalproducto,
    required this.isSyncedWithCloud,
  });

  DatabaseDetalleOrden.fromRow(Map<String, Object?> map)
      : id = map[detalleIdColumn] as int,
        orderId = map[orderIdColumn] as int,
        productId = map[productIdColumn] as int,
        cantidad = map[cantidadColumn] as double,
        totalproducto = map[totalProductoColumn] as double,
        isSyncedWithCloud =
            (map[isSyncedWithCloudColumn] as int) == 1 ? true : false;

  @override
  String toString() =>
      'Detalle Orden, ID = $id, orderId = $orderId, productoId =$productId, cantidad = $cantidad, total producto = $totalproducto';

  @override
  bool operator ==(covariant DatabaseDetalleOrden other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}
