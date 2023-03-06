import 'dart:math';
import 'dart:typed_data';
import 'package:approyal/services/services/sqlite/db_service.dart';
import 'package:approyal/services/services/sqlite/product_class.dart';
import 'package:flutter/material.dart';

class NewProductView extends StatefulWidget {
  const NewProductView({super.key});

  @override
  State<NewProductView> createState() => _NewProductViewState();
}

class _NewProductViewState extends State<NewProductView> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';
  double _price = 0.0;
  String _category = '';
  int _frequency = 0;
  late bool saved;

  late DatabaseProducts _product;
  late final ProductService _productService;

  @override
  void initState() {
    _productService = ProductService();
    saved = false;
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
  void _saveProduct(String name, String description, double price,
      String category, int frequency) async {
    //await createNewProduct();
    Random random = Random();
    _product = DatabaseProducts(
      id: random.nextInt(600),
      name: name,
      description: description,
      price: price,
      category: category,
      picture: Uint8List(10),
      frecuency: frequency,
      isSyncedWithCloud: false,
    );
    await _productService.createProduct(product: _product);
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
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter product name',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter product description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                  hintText: 'Enter product price',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
                onSaved: (value) {
                  _price = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Category',
                  hintText: 'Enter product category',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
                onSaved: (value) {
                  _category = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Frequency',
                  hintText: 'Enter product frequency',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
                onSaved: (value) {
                  _frequency = int.parse(value!);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      _saveProduct(
                          _name, _description, _price, _category, _frequency);

                      saved = false;

                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
