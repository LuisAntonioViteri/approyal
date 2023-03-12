import 'package:approyal/constants/routes.dart';
import 'package:approyal/services/services/sqlite/constants.dart';
import 'package:approyal/services/services/sqlite/detalleorden_class.dart';
import 'package:approyal/services/services/sqlite/product_class.dart';
import 'package:approyal/utilities/generics/get_arguments.dart';
import 'package:approyal/views/Pago/forma_pago_view.dart';
import 'package:approyal/views/basket/car_list_view.dart';
import 'package:approyal/views/products/products_view.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    final _carrito = context.getArgument<List<DatabaseProducts>>();

    List<DatabaseProducts> cart = [];
    List<DatabaseDetalleOrden> detalle = [];

    String valorTotal(List<DatabaseDetalleOrden> listaProductos) {
      double total = listaProductos
          .map((element) => element.totalproducto)
          .reduce((value, element) => value + element);

      return total.toStringAsFixed(2);
    }

    if (_carrito != null) {
      cart = _carrito;
      detalle = cart.map((productos) {
        return DatabaseDetalleOrden(
          id: productos.id,
          orderId: 1,
          productId: productos.id,
          cantidad: 1,
          totalproducto: productos.price,
          isSyncedWithCloud: false,
        );
      }).toList();
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
              if (cart.length == 1) {
                Navigator.of(context)
                    .pushNamed(productsRoute, arguments: false);
              }
              DatabaseDetalleOrden detalleitem = DatabaseDetalleOrden(
                id: producto.id,
                orderId: 1,
                productId: producto.id,
                cantidad: quantity.toDouble(),
                totalproducto: quantity * producto.price,
                isSyncedWithCloud: false,
              );
              if (quantity == 0) {
                setState(() {
                  cart.remove(producto);
                  detalle.removeWhere(
                      (element) => element.productId == producto.id);
                });
              }
              setState(() {
                detalle[detalle.indexWhere(
                        (element) => element.productId == detalleitem.id)] =
                    detalleitem;
                //print(detalle);
              });

              print(detalle);
            },
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(left: 120),
          height: 70,
          width: 400,
          color: Colors.grey[200],
          child: Row(
            children: <Widget>[
              Text(
                'Total: \$${valorTotal(detalle)}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.black),
              )
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
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
