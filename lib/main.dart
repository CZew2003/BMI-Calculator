import 'package:flutter/material.dart';
import 'screeens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xff0a0e21),
        ),
        scaffoldBackgroundColor: const Color(0xff0a0e21),
      ),
      home: const InputPage(),
    );
  }
}
