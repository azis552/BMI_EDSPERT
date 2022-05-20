// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:bmi/constant/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/view/bmi_data_result.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class bmiDataScreen extends StatefulWidget {
  const bmiDataScreen({Key? key}) : super(key: key);

  @override
  State<bmiDataScreen> createState() => _bmiDataScreenState();
}

// ignore: camel_case_types
class _bmiDataScreenState extends State<bmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;
  double calculateBMI() {
    double bmi = 0;
    double heightinmeter = height / 100;
    if (gender == "male") {
      bmi = (weight / pow(heightinmeter, 2));
    } else {
      bmi = (weight / pow(heightinmeter, 2));
    }

    return bmi;
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
                child: GestureDetector(
              onTap: () {
                gender = "male";
                setState(() {});
              },
              child: BmiCard(
                borderColor: (gender == "male") ? Colors.white : primaryColor,
                child: GenderIconText(
                  icon: Icons.male,
                  title: "male",
                ),
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                gender = "female";
                setState(() {});
              },
              child: BmiCard(
                borderColor: (gender == "female") ? Colors.white : primaryColor,
                child: GenderIconText(icon: Icons.female, title: 'Female'),
              ),
            ))
          ])),
          Expanded(
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
          Expanded(
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
          GestureDetector(
            onTap: () {
              final bmiCalculator = BmiCalculator(
                  height: height, weight: weight); // ignore: avoid_print
              bmiCalculator.calculateBMI();
              bmiCalculator.keputusan(bmiCalculator.bmi!);
              Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) {
                  return bmiResultScreen(
                    bmi: bmiCalculator.bmi!,
                    hasil: bmiCalculator.hasil!,
                  );
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
    this.borderColor = primaryColor,
  }) : super(key: key);
  final Widget? child;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(15, 248, 248, 248),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor!)),
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
