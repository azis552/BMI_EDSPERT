// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:bmi/constant/constant.dart';
import 'package:bmi/view/bmi_data_result.dart';
import 'package:flutter/material.dart';

class bmiDataScreen extends StatefulWidget {
  const bmiDataScreen({Key? key}) : super(key: key);

  @override
  State<bmiDataScreen> createState() => _bmiDataScreenState();
}

class _bmiDataScreenState extends State<bmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  double calculateBMI() {
    double heightinmeter = height / 100;
    final bmi = weight / pow(heightinmeter, 2);
    return bmi;
  }

  String hasil = "normal";
  String keputusan(bmi) {
    if (bmi < 16.0) {
      hasil = "Underweight (Severe thinness)";
    } else if (bmi >= 16.0 && bmi <= 16.9) {
      hasil = "Underweight (Moderate thinness)";
    } else if (bmi >= 17.0 && bmi <= 18.4) {
      hasil = "Underweight (Mild Thinness)";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      hasil = "Normal Range";
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      hasil = "Normal Range";
    } else if (bmi >= 30.0 && bmi <= 34.9) {
      hasil = "Obese (class I)";
    } else if (bmi >= 35.0 && bmi <= 39.9) {
      hasil = "Obese (class II)";
    } else if (bmi >= 40) {
      hasil = "Obese (class III)";
    }
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0a0e21),
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(children: [
          Expanded(
              child: Row(children: [
            Expanded(
              child: BmiCard(
                child: GenderIconText(
                  icon: Icons.male,
                  title: "male",
                ),
              ),
            ),
            Expanded(
              child: BmiCard(
                child: GenderIconText(icon: Icons.female, title: 'Female'),
              ),
            )
          ])),
          Expanded(
            child: Container(
              child: BmiCard(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: genderTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("$height", style: numberText),
                      Text(
                        "cm",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 12,
                      )
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 80,
                      max: 200,
                      thumbColor: Colors.red,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      })
                ],
              )),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                      child: BmiCard(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: genderTextStyle.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$weight",
                            style: numberText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  weight += 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color.fromARGB(255, 20, 27, 52),
                                constraints: BoxConstraints.tightFor(
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  weight -= 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color.fromARGB(255, 20, 27, 52),
                                constraints: BoxConstraints.tightFor(
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ],
                          )
                        ]),
                  )),
                  Expanded(
                      child: BmiCard(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: genderTextStyle.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$age",
                            style: numberText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  age += 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color.fromARGB(255, 20, 27, 52),
                                constraints: BoxConstraints.tightFor(
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  age--;
                                  setState(() {});
                                },
                                elevation: 0,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color.fromARGB(255, 20, 27, 52),
                                constraints: BoxConstraints.tightFor(
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ],
                          )
                        ]),
                  )),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print(calculateBMI());
              print(keputusan(calculateBMI()));
              Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) {
                  return bmiResultScreen(
                      bmi: calculateBMI(), hasil: keputusan(calculateBMI()));
                }),
              ));
            },
            child: Container(
              height: 50,
              color: Colors.redAccent,
              child: Center(
                  child: Text(
                "Hitung BMI",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ]));
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(15, 248, 248, 248),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: genderTextStyle,
        ),
      ],
    );
  }
}
