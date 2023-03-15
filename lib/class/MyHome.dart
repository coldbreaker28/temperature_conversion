import 'package:flutter/material.dart';
import 'package:temperature_conversion/class/convert.dart';
import 'package:temperature_conversion/class/input.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  double _inputUser = 0;
  double _Kelvin = 0;
  double _reamur = 0;
  double _fahrenheit = 0;
  double _rankine = 0;

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void konversiSuhu() {
    setState(() {
      _inputUser = double.parse(myController.text);
      _reamur = (4 / 5) * _inputUser;
      _Kelvin = 273.15 + _inputUser;
      _fahrenheit = (9 / 5) * _inputUser + 32;
      _rankine = (_inputUser + 273.15) * 9 / 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            Input(myController: myController),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Text(
                        "Suhu Dalam Celcius",
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.blue,
                          width: 5,
                        )),
                        child: Text(_inputUser.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 20)),
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        "Suhu Dalam Kelvin",
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.blue,
                          width: 5,
                        )),
                        child: Text(_Kelvin.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 20)),
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        "Suhu Dalam fahrenheit",
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.blue,
                          width: 5,
                        )),
                        child: Text(_fahrenheit.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 20)),
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        "Suhu Dalam reamur",
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.blue,
                          width: 5,
                        )),
                        child: Text(_reamur.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 20)),
                        // ignore: prefer_const_constructors
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        "Suhu Dalam rankine",
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.blue,
                          width: 5,
                        )),
                        child: Text(_rankine.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 20)),
                      )
                    ],
                  )
                ]),
            Convert(konvertHandler: konversiSuhu),
          ],
        ),
      ),
    );
  }
}
