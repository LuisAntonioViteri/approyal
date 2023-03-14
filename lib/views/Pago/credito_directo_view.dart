import 'package:approyal/services/cloud/cloud_detail.dart';
import 'package:approyal/utilities/generics/get_arguments.dart';
import 'package:flutter/material.dart';

class CreditoDirecto extends StatefulWidget {
  const CreditoDirecto({super.key});

  @override
  State<CreditoDirecto> createState() => _CreditoDirecto();
}

class _CreditoDirecto extends State<CreditoDirecto> {
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
  late final TextEditingController _textControllerEntrada;
  bool? _textvalid = true;

  @override
  void initState() {
    _textController = TextEditingController();
    _textControllerEntrada = TextEditingController();
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
        title: const Text('Crédito Directo'),
        backgroundColor: const Color.fromARGB(255, 7, 77, 228),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(30.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(left: 120),
                  height: 70,
                  width: 400,
                  color: const Color.fromARGB(255, 177, 177, 177),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Total: \$${precio.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              )),
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
                          "Agregado",
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
                                    hintText: 'Valor agregado'),
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
                                      _total = _total + double.parse(value);
                                    } else if (value.isEmpty &&
                                        _total > precio) {
                                      _total = precio;
                                    } else {
                                      _textvalid = false;
                                      const Text('Valor Invalido');
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
                          "Entrada",
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
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              hintText: 'Valor de entrada'),
                          controller: _textControllerEntrada,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          onChanged: (value) {
                            setState(() {
                              if (double.tryParse(value) != null) {
                                _total = _total - double.parse(value);
                              } else if (value.isEmpty && _total < precio) {
                                _total = precio;
                              } else {
                                _textvalid = false;
                                const Text('Valor Invalido');
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
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20),
                  height: 70,
                  width: 400,
                  color: const Color.fromARGB(255, 177, 177, 177),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Saldo a financiar: \$${_total.toStringAsFixed(2)} ',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              )),
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
                          "N° de Inversiones: ",
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
                      padding: const EdgeInsets.only(left: 60),
                      height: 50,
                      width: 30.0,
                      color: const Color.fromARGB(255, 168, 168, 168),
                      child: DropdownButton<String>(
                        value: '1',
                        onChanged: (String? newValue) {
                          // código para manejar el cambio de valor
                        },
                        items: <String>['1', '2', '3', '4']
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
          Container(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  //dding: EdgeInsets.only(left: 60),
                  height: 50,
                  width: 900,
                  color: const Color.fromARGB(255, 7, 77, 228),
                  child: Center(
                    child: Text(
                      "Total: \$${_total.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 7, 77, 228),
                  minimumSize: const Size(150, 50),
                ),
                onPressed: () {
                  //Navigate to tarjeta credito
                },
                child: const Text("Proceder al Pago"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
