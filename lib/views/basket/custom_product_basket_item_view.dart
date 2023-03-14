import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProductListCard extends StatefulWidget {
  final String name;
  final Uint8List imageUrl;
  final double price;
  final Function(int) onQuantityChanged; // New parameter

  const ProductListCard(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.onQuantityChanged}); // Updated constructor

  @override
  _ProductListCardState createState() => _ProductListCardState();
}

class _ProductListCardState extends State<ProductListCard> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image.memory(widget.imageUrl),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '\$${(widget.price * _quantity).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        _quantity == 1
                            ? IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    _quantity--;
                                  });
                                  widget.onQuantityChanged(_quantity);
                                  // Remove the product from the cart
                                },
                              )
                            : IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    _quantity--;
                                  });
                                  widget.onQuantityChanged(
                                      _quantity); // Call the callback function
                                },
                              ),
                        Text(
                          _quantity.toString(),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              _quantity++;
                            });
                            widget.onQuantityChanged(
                                _quantity); // Call the callback function
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
