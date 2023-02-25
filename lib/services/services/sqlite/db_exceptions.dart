class DatabaseAlreadyOpenException implements Exception {}

class UnableToGetDocumentsDirectory implements Exception {}

class DatabaseIsNotOpen implements Exception {}

//User Exceptions

class UserAlreadyExists implements Exception {}

class CouldNotFindUser implements Exception {}

//Product Exceptions

class ProductAlreadyExists implements Exception {}

class CouldNotFindProduct implements Exception {}

class CouldNotUpdateProduct implements Exception {}

class CouldNotDeleteProduct implements Exception {}

// Order Exceptions

class OrderAlreadyExist implements Exception {}

class CouldNotFindOrder implements Exception {}

class CouldNotUpdateOrder implements Exception {}

class CouldNotDeleteOrder implements Exception {}

//Detalle Exceptions

class DetalleOrdenAlreadyExist implements Exception {}

class CouldNotFindDetalleOrden implements Exception {}

class CouldNotUpdateDetalleOrden implements Exception {}

class CouldNotDeleteDetalleOrden implements Exception {}
