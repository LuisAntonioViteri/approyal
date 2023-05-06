import 'package:approyal/services/cloud/cloud_product.dart';
import 'package:approyal/services/cloud/firebase_cloud_storage.dart';
import 'package:approyal/services/services/auth/auth_service.dart';
import 'package:approyal/views/products/product_list_view.dart';
import 'package:flutter/material.dart';
import '../../constants/routes.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  late final FirebaseCloudStorage _productService;
  String get userId => AuthService.firebase().currentUser!.id;

  List<CloudProduct?> _carritoCompras = [];

  @override
  void initState() {
    _productService = FirebaseCloudStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.of(context).pushNamed(profileMenuRoute);
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
                  if (_carritoCompras.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(_carritoCompras.length.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.0)),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_carritoCompras.isNotEmpty) {
                  Navigator.of(context).pushNamed(
                    carritoRoute,
                    arguments:
                        _carritoCompras.whereType<CloudProduct>().toList(),
                  );
                }
              },
            ),
          ),
          //IconButton(onPressed: onPressed, icon: const Icon(Icons.cart),);
        ],
      ),
      body: StreamBuilder(
        stream: _productService.allproducts(),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              if (snapshot.hasData) {
                final allProducts = snapshot.data as Iterable<CloudProduct>;
                return ProductListView(
                  products: allProducts,
                  onAddToCart: (product) {
                    setState(() {
                      if (_carritoCompras.contains(product) == false) {
                        _carritoCompras.add(product);
                      }
                    });
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            default:
              return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}



// Show logout dialog confirmation and returns a boolean
