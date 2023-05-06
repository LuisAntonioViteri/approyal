import 'package:approyal/services/cloud/cloud_detail.dart';
import 'package:approyal/utilities/generics/get_arguments.dart';
import 'package:approyal/views/Pago/tarjeta_credito_view.dart';
import 'package:flutter/material.dart';

import 'credito_directo_view.dart';

class ChequeDirecto extends StatefulWidget {
  const ChequeDirecto({super.key});

  @override
  State<ChequeDirecto> createState() => _ChequeDirectoState();
}

class _ChequeDirectoState extends State<ChequeDirecto> {
  List<CloudDetail> carrito = [];
  List<CloudDetail>? cart = [];
  double precio = 0;
  int ncheques = 1;
  double interes = 0.01;
  List<int> numcheques = [1, 2, 3, 4, 5];
  List<double> cantintereses = [0.01, 0.02, 0.03, 0.04, 0.05, 0.06];

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
        title: const Text('Cheque Directo'),
        backgroundColor: const Color.fromARGB(255, 7, 77, 228),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(left: 120),
                height: 70,
                width: 400,
                color: const Color.fromARGB(255, 177, 177, 177),
                child: Row(
                  children: [
                    Text(
                      'Total: \$${precio.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          //dding: EdgeInsets.only(left: 60),
                          height: 50,
                          width: 350,
                          color: const Color.fromARGB(255, 7, 77, 228),
                          child: const Center(
                            child: Text(
                              "N° de Cheques",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.only(left: 30),
                          height: 50,
                          width: 30.0,
                          color: const Color.fromARGB(255, 168, 168, 168),
                          child: Center(
                            child: DropdownButton(
                              value: ncheques,
                              isExpanded: true,
                              items: numcheques
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  alignment: Alignment.center,
                                  value: value,
                                  child: Text(
                                    value.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  if (value != null) {
                                    ncheques = value;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //dding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 400,
                        color: const Color.fromARGB(255, 7, 77, 228),
                        child: const Center(
                          child: Text(
                            "40% de entrada",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //padding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 30.0,
                        color: const Color.fromARGB(255, 168, 168, 168),
                        child: Center(
                          child: Text(
                            (precio * 0.4).toStringAsFixed(2),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //dding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 400,
                        color: const Color.fromARGB(255, 7, 77, 228),
                        child: const Center(
                          child: Text(
                            "Saldo restante",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //padding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 30.0,
                        color: const Color.fromARGB(255, 168, 168, 168),
                        child: Center(
                          child: Text(
                            (precio * 0.6).toStringAsFixed(2),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //dding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 400,
                        color: const Color.fromARGB(255, 7, 77, 228),
                        child: const Center(
                          child: Text(
                            "Intereses",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //padding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 30.0,
                        color: const Color.fromARGB(255, 168, 168, 168),
                        child: Center(
                          child: Text(
                            ((precio * 0.6) * interes).toStringAsFixed(2),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.centerRight,
                //padding: EdgeInsets.only(left: 100),
                height: 70,
                width: 400,
                color: const Color.fromARGB(255, 7, 77, 228),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                          child: Text(
                        'Total a pagar:\$${((precio * 0.6) * (1 + interes)).toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )),
                    )
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //dding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 400,
                        color: const Color.fromARGB(0, 7, 77, 228),
                        child: const Center(
                          child: Text(
                            "Cheques de: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 5, 5, 5)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //padding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 30.0,
                        color: const Color.fromARGB(255, 168, 168, 168),
                        child: Center(
                          child: Text(
                            (((precio * 0.6) * (1 + interes)) / ncheques)
                                .toStringAsFixed(2),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        //dding: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 400,
                        color: const Color.fromARGB(0, 188, 195, 209),
                        child: const Center(
                          child: Text(
                            "Con interés al: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 5, 5, 5)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.only(left: 60),
                        height: 50,
                        width: 30.0,
                        color: const Color.fromARGB(255, 168, 168, 168),
                        child: Center(
                          child: DropdownButton<double>(
                            value: interes,
                            items: cantintereses
                                .map<DropdownMenuItem<double>>((double value) {
                              return DropdownMenuItem<double>(
                                value: value,
                                child: Text(
                                  '${(value * 100).toStringAsFixed(0)} %',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                if (newValue != null) {
                                  interes = newValue;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 7, 77, 228),
                  minimumSize: const Size(150, 50),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => (CreditoDirecto())));
                },
                child: const Text("Proceder al Pago"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
