import 'package:approyal/services/services/auth/auth_service.dart';
import 'package:approyal/services/services/sqlite/db_service.dart';
import 'package:approyal/services/services/sqlite/product_class.dart';
import 'package:approyal/views/products/product_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constants/routes.dart';
import '../../enums/menu_action.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  late final ProductService _productService;
  String get userEmail => AuthService.firebase().currentUser!.email!;
  List<DatabaseProducts?> _carritoCompras = [];

  @override
  void initState() {
    _productService = ProductService();
    //_carritoCompras = [];
    super.initState();
  }

  @override
  void dispose() {
    _productService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.pushNamed(context, profileMenuRoute);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    size: 38,
                    color: Colors.white,
                  ),
                  if (_carritoCompras!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(_carritoCompras!.length.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.0)),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_carritoCompras.isNotEmpty) {
                  //Navigator.pushNamed(context, routeName)
                }
              },
            ),
          )
          //IconButton(onPressed: onPressed, icon: const Icon(Icons.cart),);
        ],
      ),
      body: FutureBuilder(
        future: _productService.getOrCreateUser(email: userEmail),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return StreamBuilder(
                stream: _productService.allProducts,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      if (snapshot.hasData) {
                        final allProducts =
                            snapshot.data as List<DatabaseProducts>;
                        return ProductListView(
                          products: allProducts,
                          onAddToCart: (product) {
                            _carritoCompras!.add(product);
                          },
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    default:
                      return const CircularProgressIndicator();
                  }
                },
              );
            default:
              return const Text('Hello');
          }
        }),
      ),
    );
  }
}

// Show logout dialog confirmation and returns a boolean
