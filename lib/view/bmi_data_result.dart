import 'package:bmi/view/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class bmiResultScreen extends StatelessWidget {
  const bmiResultScreen({
    Key? key,
    required this.bmi,
    required this.hasil,
  }) : super(key: key);
  final double bmi;
  final String hasil;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0e21),
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(children: [
        Expanded(
            child: Container(
          child: Text(
            "Hasil Perhitungan",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )),
        Expanded(
          flex: 11,
          child: BmiCard(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "$hasil",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    bmi.toStringAsFixed(1).toString(),
                    style: TextStyle(
                        fontSize: 87,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "Your BMI result is $hasil ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            color: Colors.redAccent,
            child: Center(
                child: Text(
              "Hitung Ulang",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            )),
          ),
        ),
      ]),
    );
  }
}
