import 'package:approyal/services/cloud/cloud_product.dart';
import 'package:approyal/views/products/custom_product_card_view.dart';

import 'package:flutter/material.dart';

typedef AddToCartCallBack = void Function(CloudProduct product);

class ProductListView extends StatelessWidget {
  final Iterable<CloudProduct> products;

  final AddToCartCallBack onAddToCart;

  const ProductListView({
    super.key,
    required this.products,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products.elementAt(index);
        return ProductCard(
          name: product.name,
          description: product.description,
          price: product.price,
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkT3Ixe87Fm8AKUFfIhyiPAHjDGOcg7oezxg&usqp=CAU',
          onPressed: () {
            onAddToCart(product);
          },
        );
      },
    );
  }
}
