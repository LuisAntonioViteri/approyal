import 'dart:typed_data';

import 'constants.dart';

class DatabaseProducts {
  final int id;
  final String name;
  final String description;
  final double price;
  final String category;
  final Uint8List picture;
  final int frecuency;
  final bool isSyncedWithCloud;

  DatabaseProducts({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.picture,
    required this.frecuency,
    required this.isSyncedWithCloud,
  });

  DatabaseProducts.fromRow(Map<String, Object?> map)
      : id = map[productIdColumn] as int,
        name = map[nameColumn] as String,
        description = map[descriptionColumn] as String,
        price = map[priceColumn] as double,
        category = map[categoryColumn] as String,
        picture = map[pictureColumn] as Uint8List,
        frecuency = map[frecuencyColumn] as int,
        isSyncedWithCloud =
            (map[isSyncedWithCloudColumn] as int) == 1 ? true : false;

  @override
  String toString() =>
      'Productos, ID = $id, nombre = $name, descripcion = $description, precio=$price, categoria=$category, foto=$picture, frecuencia=$frecuency, sincronizado=$isSyncedWithCloud';

  @override
  bool operator ==(covariant DatabaseProducts other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}
