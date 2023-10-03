import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusableCard.dart';
import '../components/genderContainer.dart';
import '../components/constants.dart';
import '../components/rounded_icon_button.dart';
import '../components/select_widget_two_buttons.dart';
import '../components/buttom_button.dart';
import 'results_page.dart';
import 'package:bmi_calculator/bmi_manager.dart';

enum Genders {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders? selectedGender;

  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    myFunction: () {
                      setState(() {
                        selectedGender = Genders.male;
                      });
                    },
                    myColor: selectedGender == Genders.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const GenderContainer(
                      icono: FontAwesomeIcons.mars,
                      message: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    myFunction: () {
                      setState(() {
                        selectedGender = Genders.female;
                      });
                    },
                    myColor: selectedGender == Genders.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const GenderContainer(
                      icono: FontAwesomeIcons.venus,
                      message: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              myColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kTextColor,
                      overlayColor: const Color(0x1feb1555),
                      trackHeight: 3.0,
                      thumbColor: kContainerColor,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SelectedWidgetTwoButtons(
                    mainWidget: Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    icon1: FontAwesomeIcons.minus,
                    icon2: FontAwesomeIcons.plus,
                    title: 'Weight',
                    func1: () {
                      setState(() {
                        if (weight > 20) {
                          weight--;
                        }
                      });
                    },
                    func2: () {
                      setState(() {
                        if (weight < 200) {
                          weight++;
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                  child: SelectedWidgetTwoButtons(
                    mainWidget: Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    icon1: FontAwesomeIcons.minus,
                    icon2: FontAwesomeIcons.plus,
                    title: 'Age',
                    func1: () {
                      setState(() {
                        if (age > 5) {
                          age--;
                        }
                      });
                    },
                    func2: () {
                      setState(() {
                        if (age < 100) {
                          age++;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ButtomButton(
            message: 'Calculate',
            onTap: () {
              BMIManager calc = BMIManager(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultDescrition: calc.getInterpretation(),
                    resultText: calc.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
