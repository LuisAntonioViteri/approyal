import 'package:flutter/material.dart';

import 'credito_directo_view.dart';

class ChequeDirecto extends StatefulWidget {
  const ChequeDirecto({super.key});

  @override
  State<ChequeDirecto> createState() => _ChequeDirectoState();
}

class _ChequeDirectoState extends State<ChequeDirecto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cheque Directo'),
        backgroundColor: const Color.fromARGB(255, 7, 77, 228),
      ),
      body: ListView(
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
                      padding: const EdgeInsets.only(left: 60),
                      height: 50,
                      width: 30.0,
                      color: const Color.fromARGB(255, 168, 168, 168),
                      child: DropdownButton<String>(
                        value: 'Ch° 1',
                        onChanged: (String? newValue) {
                          // código para manejar el cambio de valor
                        },
                        items: <String>['Ch° 1', 'Ch° 2', 'Ch° 3', 'Ch° 4']
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.centerRight,
              //padding: EdgeInsets.only(left: 100),
              height: 70,
              width: 400,
              color: const Color.fromARGB(255, 7, 77, 228),
              child: Row(
                children: const <Widget>[
                  Center(
                      child: Text(
                    'Total a pagar: ****,**',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ))
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
                      color: const Color.fromARGB(0, 188, 195, 209),
                      child: const Center(
                        child: Text(
                          "Interes del: ",
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
                        value: '10%',
                        onChanged: (String? newValue) {
                          // código para manejar el cambio de valor
                        },
                        items: <String>['10%', '12%', '14%', '16%']
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
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 7, 77, 228),
                minimumSize: const Size(150, 50),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        (const CreditoDirecto())));
              },
              child: const Text("Proceder al Pago"),
            ),
          ),
        ],
      ),
    );
  }
}
