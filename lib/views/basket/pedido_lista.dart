import 'package:approyal/constants/routes.dart';
import 'package:approyal/services/cloud/cloud_detail.dart';
import 'package:approyal/services/cloud/cloud_product.dart';
import 'package:approyal/utilities/generics/get_arguments.dart';
import 'package:approyal/views/basket/car_list_view.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late List<CloudProduct> cart = [];
  late List<CloudDetail> detalle = [];
  late List<CloudProduct>? carrito = [];
  late double precio = 0;

  void valorTotal(Iterable<CloudDetail> listaProductos) {
    if (listaProductos.isEmpty) {
      setState(() {
        precio = 0;
      });
    }
    double total = listaProductos
        .map((element) => element.totalproducto)
        .reduce((value, element) => value + element);

    setState(() {
      precio = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (precio == 0) {
      carrito = context.getArgument<List<CloudProduct>>();
      cart = carrito!;

      detalle = cart.map((product) {
        return CloudDetail(
          documentId: '',
          orderId: '',
          productId: product.documentId,
          cantidad: 1,
          totalproducto: product.price,
        );
      }).toList();
      valorTotal(detalle);
    }

    Container pagoTotal(Iterable<CloudDetail> cart) {
      return Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(left: 120),
        height: 70,
        width: 400,
        color: Colors.grey[200],
        child: Row(
          children: [
            Text(
              'Total: \$${precio.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu Canasta'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: CartListView(
            products: cart,
            onChangedQuantity: (producto, quantity) {
              if (cart.isEmpty) {
                Navigator.of(context)
                    .pushNamed(productsRoute, arguments: false);
              }
              CloudDetail detalleitem = CloudDetail(
                documentId: producto.documentId,
                orderId: '',
                productId: producto.documentId,
                cantidad: quantity.toDouble(),
                totalproducto: quantity * producto.price,
              );
              if (quantity <= 0) {
                setState(() {
                  cart.remove(producto);
                  detalle.removeWhere(
                      (element) => element.productId == producto.documentId);
                });
              } else {
                setState(() {
                  int index = detalle.toList().indexWhere(
                      (element) => element.productId == detalleitem.productId);
                  detalle[index] = detalleitem;
                  valorTotal(detalle);
                });
              }
            },
          ),
        ),
        pagoTotal(detalle),
        ElevatedButton(
          onPressed: () {
            detalle.map((e) => print(e.productId + e.totalproducto.toString()));
            Navigator.of(context).pushNamed(
              resumenPagoRoute,
              arguments: detalle,
            );
          },
          child: const Text("Proceder al Pago"),
        )
      ]),
    );
  }
}
