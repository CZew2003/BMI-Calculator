import 'dart:math';

class BMIManager {
  BMIManager({
    required this.height,
    required this.weight,
  });
  final int height;
  final int weight;

  late double _bmi;

  String calculateBMI() {
    _bmi = (weight) / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi <= 18.5) {
      return 'Underweight';
    }
    return 'Normal';
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi <= 18.5) {
      return 'You have a lower than normal body weight. Try to eat more.';
    }
    return 'You have a normal body weight. Good job.';
  }
}
