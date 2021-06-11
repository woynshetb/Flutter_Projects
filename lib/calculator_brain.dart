import 'dart:math';

class CalulatorBrain {
  final int height;
  final int weight;
  double _bmi;
  CalulatorBrain({this.height, this.weight});
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher thank Normal body weight . Try to Exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight . Good Job';
    } else {
      return 'You have a lower than normal weight. You can eat a bit more.';
    }
  }
}
