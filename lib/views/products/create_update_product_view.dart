import 'package:approyal/services/cloud/cloud_product.dart';
import 'package:approyal/services/cloud/cloud_storage_exception.dart';
import 'package:approyal/services/cloud/firebase_cloud_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateUpdateNoteView extends StatefulWidget {
  const CreateUpdateNoteView({super.key});

  @override
  State<CreateUpdateNoteView> createState() => _CreateUpdateNoteViewState();
}

class _CreateUpdateNoteViewState extends State<CreateUpdateNoteView> {
  final _formKey = GlobalKey<FormState>();
  String _code = '';
  String _name = '';
  String _description = '';
  double _price = 0.0;
  String _category = '';
  String _clasification = '';
  Uint8List _imageBytes = Uint8List(0);

  late CloudProduct _product;
  late final FirebaseCloudStorage _productService;

  @override
  void initState() {
    _productService = FirebaseCloudStorage();
    super.initState();
  }

/*
  Future<DatabaseProducts> createNewProduct() async {
    final existingProduct = _product;
    if (existingProduct != null) {
      return existingProduct;
    } else {
      return await _productService.createProduct(product: existingProduct!);
    }
    //final currentUser = AuthService.firebase().currentUser!;
    //final email = currentUser.email!;
    //final owner = await _productService.getUser(email: email);
  }
*/
  void _saveProduct(
    String code,
    String name,
    String description,
    double price,
    String category,
    String clasification,
    Uint8List image,
  ) async {
    //await createNewProduct();
    _product = CloudProduct(
      documentId: '',
      code: code,
      name: name,
      description: description,
      price: price,
      category: category,
      clasification: clasification,
      picture: image,
      frecuency: 1,
    );
    await _productService.createNewProduct(producto: _product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      final bytes = await ImageSelector().getImageBytes();
                      setState(() {
                        _imageBytes = bytes!;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: _imageBytes.isEmpty
                          ? Image.asset(
                              'assets/images/add-image.png',
                              width: 150,
                              height: 150,
                            )
                          : Image.asset(
                              'assets/images/add-image.png',
                              width: 150,
                              height: 150,
                            ),
                    ),
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Code',
                  hintText: 'Ingresa código del producto',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor ingresa un código';
                  }
                  return null;
                },
                onSaved: (value) {
                  _code = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ingresa el nombre del producto',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor ingresa el nombre del producto';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descripcion',
                  hintText: 'Ingresa una descripcion del producto',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa una descripción';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Precio',
                  hintText: 'Ingresa el precio del producto',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa un precio';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingresa un precio valido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _price = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Categoría',
                  hintText: 'Ingresa una categoría para tu producto',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa una categoría';
                  }
                  return null;
                },
                onSaved: (value) {
                  _category = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Clasificación',
                  hintText: 'Ingresa la clasificación del producto',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa una clasificación';
                  }
                  return null;
                },
                onSaved: (value) {
                  _clasification = value!;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        if (_imageBytes.isEmpty) {
                          final ByteData assetImage = await rootBundle
                              .load('assets/images/add-image.png');
                          _imageBytes = assetImage.buffer.asUint8List();
                        }

                        _saveProduct(
                          _code,
                          _name,
                          _description,
                          _price,
                          _category,
                          _clasification,
                          _imageBytes,
                        );

                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Crear'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSelector {
  Future<Uint8List?> getImageBytes() async {
    try {
      final status = await Permission.photos.request();
      if (status.isGranted) {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(
          source: ImageSource
              .gallery, // You can also use ImageSource.camera to take a new picture with the camera
          maxWidth: 800,
          maxHeight: 800,
          imageQuality: 80,
        );
        if (pickedFile == null) {
          final ByteData assetImage =
              await rootBundle.load('assets/images/add-image.png');
          final imageBytes = assetImage.buffer.asUint8List();
          return imageBytes;
        }
        final bytes = await pickedFile.readAsBytes();
        return Uint8List.fromList(bytes);
      } else {
        final ByteData assetImage =
            await rootBundle.load('assets/images/add-image.png');
        final imageBytes = assetImage.buffer.asUint8List();
        return imageBytes;
      }
    } catch (e) {
      throw CouldNotCreateProductImageException();
    }
  }
}
