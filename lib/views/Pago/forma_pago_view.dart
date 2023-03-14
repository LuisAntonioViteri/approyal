import 'package:approyal/constants/routes.dart';
import 'package:approyal/services/cloud/cloud_detail.dart';
import 'package:approyal/views/Pago/cheque_directo_view.dart';
import 'package:approyal/views/Pago/credito_directo_view.dart';
import 'package:approyal/views/Pago/tarjeta_credito_view.dart';
import 'package:approyal/utilities/generics/get_arguments.dart';
import 'package:flutter/material.dart';

class FormaPago extends StatefulWidget {
  const FormaPago({super.key});

  @override
  State<FormaPago> createState() => _FormaPagoState();
}

class _FormaPagoState extends State<FormaPago> {
  double precio = 0;
  List<CloudDetail> carrito = [];
  List<CloudDetail>? cart = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    cart = context.getArgument<List<CloudDetail>>();
    carrito = cart!;
    if (precio == 0) {
      final double total = carrito
          .map((element) => element.totalproducto)
          .reduce((value, element) => value + element);
      setState(() {
        precio = total;
      });
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text('Menú de Pagos'),
        ),
        body: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        color: const Color.fromARGB(255, 7, 77, 228),
                        child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Precio de Compra:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          height: 80,
                          color: const Color.fromARGB(255, 7, 77, 228),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  precio.toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.white),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        color: const Color.fromARGB(255, 7, 77, 228),
                        child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Iva:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          height: 80,
                          color: const Color.fromARGB(255, 7, 77, 228),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  (precio * 0.12).toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.white),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        color: const Color.fromARGB(255, 7, 77, 228),
                        child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Precio de Total:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          height: 80,
                          color: const Color.fromARGB(255, 7, 77, 228),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  (precio * 1.12).toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.white),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                )),
            const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Formas de Pago:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black),
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(chequeRoute, arguments: carrito);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: const Text(
                    'Cheque Directo',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(creditoRoute, arguments: carrito);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: const Text(
                    'Crédito Directo',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      tarjetaCreditoRoute,
                      arguments: carrito,
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  //child: const Text("Tarjeta de Crédito"),
                  child: const Text(
                    'Tarjeta de Crédito',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
