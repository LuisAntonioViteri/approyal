import 'package:approyal/services/services/sqlite/product_class.dart';
import 'package:approyal/views/basket/custom_product_basket_item_view.dart';

import 'package:flutter/material.dart';

typedef OnChangedQuantity = void Function(
    DatabaseProducts product, int quantity);

class CartListView extends StatelessWidget {
  final List<DatabaseProducts> products;

  final OnChangedQuantity onChangedQuantity;

  const CartListView({
    super.key,
    required this.products,
    required this.onChangedQuantity,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Text('No tienes items agregados al carrito'),
      );
    } else {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        //physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductListCard(
              name: product.name,
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkT3Ixe87Fm8AKUFfIhyiPAHjDGOcg7oezxg&usqp=CAU',
              price: product.price,
              onQuantityChanged: (newQuantity) {
                onChangedQuantity(product, newQuantity);
              });
        },
      );
    }
  }
}
