import 'dart:math';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? gender;
  String? hasil;
  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {}
  double calculateBMI() {
    double heightinmeter = height! / 100;

    bmi = (weight! / pow(heightinmeter, 2));

    return bmi!;
  }

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
    return hasil!;
  }
}
