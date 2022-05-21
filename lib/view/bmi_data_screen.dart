// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:bmi/constant/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/view/bmi_data_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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

  List<Widget> generateList(start, end) {
    List<Widget> weigths = [];
    for (var i = start; i < end; i++) {
      weigths.add(Text(
        "$i",
        style:
            genderTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
      ));
    }
    return weigths;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(children: [
          Row(children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                gender = "male";
                setState(() {});
              },
              child: BmiCard(
                borderColor: (gender == "male") ? primaryColor : Colors.white,
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
                borderColor: (gender == "female") ? primaryColor : Colors.white,
                child: GenderIconText(icon: Icons.female, title: 'Female'),
              ),
            ))
          ]),
          BmiCard(
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
                        color: primaryColor),
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
                  activeColor: primaryColor,
                  onChanged: (value) {
                    height = value.toInt();
                    setState(() {});
                  })
            ],
          )),
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
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: CupertinoPicker(
                            itemExtent: 25,
                            magnification: 2,
                            scrollController:
                                FixedExtentScrollController(initialItem: 50),
                            useMagnifier: true,
                            onSelectedItemChanged: (val) {
                              weight = val;
                            },
                            children: generateList(20, 220),
                          ),
                        ),
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
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: CupertinoPicker(
                            itemExtent: 25,
                            magnification: 2,
                            scrollController:
                                FixedExtentScrollController(initialItem: 50),
                            useMagnifier: true,
                            onSelectedItemChanged: (val) {
                              weight = val;
                            },
                            children: generateList(20, 220),
                          ),
                        ),
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
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(24)),
              child: Center(
                  child: Text(
                "Hitung BMI",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: primaryColor,
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
          color: primaryColor,
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
