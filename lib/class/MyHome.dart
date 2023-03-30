import 'package:flutter/material.dart';
import 'package:temperature_conversion/class/convert.dart';
import 'package:temperature_conversion/class/input.dart';
import 'package:temperature_conversion/class/Result.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  double _fahrenheit = 0;
  double _rankine = 0;
  String _newValue = "Kelvin";
  double _result = 0;

  var listItem = ["Kelvin", "Reamur", "Fahrenheit", "Rankine"];

  final myController = TextEditingController();

  get Key => null;

  List<String> listViewItem = <String>[];

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void konversiSuhu() {
    setState(() {
      _inputUser = double.parse(myController.text);

      if (_newValue == "Kelvin") {
        _result = 273.15 + _inputUser;
      } else if (_newValue == "Fahrenheit") {
        _result = (9 / 5) * _inputUser + 32;
      } else if (_newValue == "Rankine") {
        _result = (_inputUser + 273.15) * 9 / 5;
      } else {
        _result = (4 / 5) * _inputUser;
      }
    });
    listViewItem.add(_newValue + " : " + _result.toString());

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
          children: [
            Input(myController: myController),
            DropdownButton<String>(
                items: listItem.map(myDropDownMenuItem).toList(),
                value: _newValue,
                onChanged: onChangeDropDown),
            Result(result: _result),
            Convert(konvertHandler: konversiSuhu),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: const Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
                child: Column(
              children: listViewItem.map((String value) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              }).toList(),
            )),
          ],
        ),
      ),
    );
  }

  void onChangeDropDown(String? changeValue) {
    setState(() {
      _newValue = changeValue!;
      konversiSuhu();
    });
  }

  DropdownMenuItem<String> myDropDownMenuItem(String value) {
    return DropdownMenuItem<String>(value: value, child: Text(value));
  }
}
