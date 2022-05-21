import 'package:bmi/constant/constant.dart';
import 'package:bmi/view/bmi_data_screen.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(children: [
        const Expanded(
            child: Text(
          "Hasil Perhitungan",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: primaryColor),
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
                    // ignore: unnecessary_string_interpolations
                    "$hasil",
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  Text(
                    bmi.toStringAsFixed(1).toString(),
                    style: const TextStyle(
                        fontSize: 87,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  Text(
                    "Your BMI result is $hasil ",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 26, color: primaryColor),
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
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(24)),
            child: Center(
                child: Text(
              "Hitung Lagi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: primaryColor,
              ),
            )),
          ),
        ),
      ]),
    );
  }
}
