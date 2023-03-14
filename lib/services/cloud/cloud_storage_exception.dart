class CloudStorageException implements Exception {
  const CloudStorageException();
}

// C in CRUD
class CouldNotCreateProductImageException extends CloudStorageException {}

class CouldNotCreateProductException extends CloudStorageException {}

// R in CRUD
class CouldNotGetAllProductException extends CloudStorageException {}

// U in CRUD
class CouldNotUpdateProductException extends CloudStorageException {}

// D in CRUD
class CouldNotDeleteProductException extends CloudStorageException {}

// C in CRUD
class CouldNotCreateOrderException extends CloudStorageException {}

// R in CRUD
class CouldNotGetAllOrderException extends CloudStorageException {}

// U in CRUD
class CouldNotUpdateOrderException extends CloudStorageException {}

// D in CRUD
class CouldNotDeleteOrderException extends CloudStorageException {}

// C in CRUD
class CouldNotCreateDetailException extends CloudStorageException {}

// R in CRUD
class CouldNotGetAllDetailsException extends CloudStorageException {}

// U in CRUD
class CouldNotUpdateDetailException extends CloudStorageException {}

// D in CRUD
class CouldNotDeleteDetailException extends CloudStorageException {}

// C in CRUD
class CouldNotCreatePaymentMethodException extends CloudStorageException {}

// R in CRUD
class CouldNotGetAllPaymentMethodsException extends CloudStorageException {}

// U in CRUD
class CouldNotUpdatePaymentMethodException extends CloudStorageException {}

// D in CRUD
class CouldNotDeletePaymentMethodException extends CloudStorageException {}

// C in CRUD
class CouldNotCreateProviderTcException extends CloudStorageException {}

// R in CRUD
class CouldNotGetAllProviderTcsException extends CloudStorageException {}

// U in CRUD
class CouldNotUpdateProviderTcException extends CloudStorageException {}

// D in CRUD
class CouldNotDeleteProviderTcException extends CloudStorageException {}
