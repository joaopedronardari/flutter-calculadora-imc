import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_imc_calculator/constants/app_constants.dart';
import 'package:flutter_imc_calculator/widgets/left_bar.dart';
import 'package:flutter_imc_calculator/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora de IMC",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Altura (m)',
                      hintStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Peso (kg)',
                      hintStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);

                setState(() {
                  _bmiResult = _w / (_h * _h);

                  if (_bmiResult < 18.5) {
                    _textResult = "Abaixo do peso";
                  } else if (_bmiResult < 25) {
                    _textResult = "Peso Normal";
                  } else if (_bmiResult < 30) {
                    _textResult = "Sobrepeso";
                  } else if (_bmiResult < 35) {
                    _textResult = "Obesidade Grau I (obesas)";
                  } else if (_bmiResult < 40) {
                    _textResult = "Obesidade Grau II (moderada)";
                  } else {
                    _textResult = "Obesidade Grau III e IV (grave/gravíssima)";
                  }

                  // if (_bmiResult > 25) {
                  //   _textResult = "Acima do peso";
                  // } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                  //   _textResult = "Peso Normal";
                  // } else {
                  //   _textResult = "Abaixo do peso";
                  // }
                });
              },
              child: Container(
                  child: Text(
                "Calcular",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor,
                ),
              )),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: accentHexColor,
                ),
              ),
            ),
            Container(
              child: Text(
                "kg/m²",
                style: TextStyle(
                  fontSize: 25,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 70,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 20,
            ),
            RightBar(
              barWidth: 70,
            ),
            SizedBox(
              height: 20,
            ),
            RightBar(
              barWidth: 70,
            ),
          ],
        ),
      ),
    );
  }
}
