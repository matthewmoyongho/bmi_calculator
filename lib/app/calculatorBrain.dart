import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  CalculatorBrain({this.height, this.weight});
  double _bmi;

  String bmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi <= 18.5) {
      return "Underweihgt";
    } else {
      return "Normal";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "Your BMI apears to be more than normal. You need to excercise more";
    } else if (_bmi <= 18.5) {
      return "Your BMI is less than normal. try and eat more food";
    } else {
      return "Your BMI is Normal. Great job";
    }
  }
}
