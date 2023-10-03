import 'package:flutter/material.dart';
import '../components/reusableCard.dart';
import '../components/constants.dart';
import '../components/buttom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.bmiResult,
    required this.resultDescrition,
    required this.resultText,
  });

  final String bmiResult;
  final String resultText;
  final String resultDescrition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Text(
              'Your Result',
              style: kNumberTextStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              myColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kNumberResultTextStyle,
                  ),
                  Text(
                    resultDescrition,
                    textAlign: TextAlign.center,
                    style: kDescriptionTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: ButtomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  message: 'Recalculate'))
        ],
      ),
    );
  }
}
