import 'package:flutter/material.dart';

class CreditoDirecto extends StatefulWidget {
  const CreditoDirecto({super.key});

  @override
  State<CreditoDirecto> createState() => _CreditoDirecto();
}

class _CreditoDirecto extends State<CreditoDirecto> {
  bool? _agree = false;
  @override
  Widget build(BuildContext context) {
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
                    children: const <Widget>[
                      Text(
                        'Total: ****,**',
                        style: TextStyle(
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
          Row(
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
                      child: const Center(
                        child: Text(
                          "***,**",
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
                      child: const Center(
                        child: Text(
                          "***,**",
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
            ],
          ),
          Container(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(left: 20),
                    height: 70,
                    width: 400,
                    color: const Color.fromARGB(255, 177, 177, 177),
                    child: Row(
                      children: const <Widget>[
                        Text(
                          'Saldo a financiar:   ****,**',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                )),
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
                  child: const Center(
                    child: Text(
                      "Total a pagar:       ****,**",
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
