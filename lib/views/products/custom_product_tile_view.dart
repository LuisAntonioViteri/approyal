import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final Future<void> Function() onAddToCart;

  const ProductListTile({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl),
      title: Text(name),
      subtitle: Text(description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('\$$price', style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: () async {
              await onAddToCart();
            },
            icon: const Icon(Icons.add),
            label: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
