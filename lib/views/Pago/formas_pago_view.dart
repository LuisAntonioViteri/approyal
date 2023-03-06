import 'package:approyal/views/Pago/cheque_directo_view.dart';
import 'package:approyal/views/Pago/credito_directo_view.dart';
import 'package:approyal/views/Pago/tarjeta_credito_view.dart';
import 'package:flutter/material.dart';

class FormaPago extends StatefulWidget {
  const FormaPago({super.key});

  @override
  State<FormaPago> createState() => _FormaPagoState();
}

class _FormaPagoState extends State<FormaPago> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menú de Pagos'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 80,
                    color: const Color.fromARGB(255, 7, 77, 228),
                    child: const Center(
                        child: Text(
                      'Precio de Compra:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 80,
                    color: const Color.fromARGB(255, 7, 77, 228),
                    child: const Center(
                        child: Text(
                      'Iva:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 80,
                    color: const Color.fromARGB(255, 7, 77, 228),
                    child: const Center(
                        child: Text(
                      'Precio Total:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            (const ChequeDirecto())));
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            (const CreditoDirecto())));
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            (const TarjetaCredito())));
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
