import 'package:approyal/services/cloud/cloud_detail.dart';
import 'package:approyal/utilities/generics/get_arguments.dart';
import 'package:approyal/views/Pago/detalle_tarjeta_view.dart';
import 'package:flutter/material.dart';

class TarjetaCredito extends StatefulWidget {
  const TarjetaCredito({super.key});

  @override
  State<TarjetaCredito> createState() => _TarjetaCreditoState();
}

class _TarjetaCreditoState extends State<TarjetaCredito> {
  bool? _agree = false;
  String agregado = '';
  List<CloudDetail> carrito = [];
  List<CloudDetail>? cart = [];
  double precio = 0;
  double _total = 0;
  int ncheques = 1;
  double interes = 0.01;
  List<int> numcheques = [1, 2, 3, 4, 5];
  List<double> cantintereses = [0.01, 0.02, 0.03, 0.04, 0.05, 0.06];
  late final TextEditingController _textController;
  bool? _textvalid = true;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

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

        _total = total;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarjeta de Crédito'),
        backgroundColor: const Color.fromARGB(255, 7, 77, 228),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 120),
                          height: 70,
                          width: 100,
                          color: const Color.fromARGB(255, 177, 177, 177),
                          child: Row(
                            children: [
                              Text(
                                'Total: \$${precio.toStringAsFixed(2)}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.0,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ],
            ),
            Row(
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
                        width: 400,
                        color: const Color.fromARGB(255, 7, 77, 228),
                        child: const Center(
                          child: Text(
                            "Efectivo",
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
                        //padding: EdgeInsets.only(left: 0),
                        height: 50,
                        width: 30.0,
                        color: const Color.fromARGB(255, 168, 168, 168),
                        child: Checkbox(
                          value: _agree,
                          onChanged: (value) {
                            setState(() {
                              _agree = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _agree == false
                ? Container()
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          //borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.only(left: 60),
                            height: 30,
                            width: 400,
                            color: const Color.fromARGB(0, 7, 77, 228),
                            child: const Text(
                              "Cantidad:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              //padding: EdgeInsets.only(left: 60),
                              height: 50,
                              width: 30.0,
                              color: const Color.fromARGB(255, 168, 168, 168),
                              child: Center(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      hintText: 'Entrada'),
                                  controller: _textController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  onChanged: (value) {
                                    setState(() {
                                      if (double.tryParse(value) != null) {
                                        _total = precio + double.parse(value);
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.only(left: 150),
                        height: 50,
                        width: 30.0,
                        color: const Color.fromARGB(255, 168, 168, 168),
                        child: DropdownButton<String>(
                          value: 'VISA',
                          onChanged: (String? newValue) {
                            // código para manejar el cambio de valor
                          },
                          items: <String>[
                            'VISA',
                            'PICHINCHA',
                            'GUAYAQUIL',
                            'MASTERCARD'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            );
                          }).toList(),
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
                            "Diferir a: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 0, 0, 0)),
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
                        child: DropdownButton<String>(
                          value: '3',
                          onChanged: (String? newValue) {
                            // código para manejar el cambio de valor
                          },
                          items: <String>['3', '6', '9', '12']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            );
                          }).toList(),
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
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 7, 77, 228),
                  minimumSize: const Size(150, 50),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => (const detalle_tc())));
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
