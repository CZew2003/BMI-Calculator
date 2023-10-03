import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class GenderContainer extends StatelessWidget {
  const GenderContainer(
      {super.key, required this.icono, required this.message});

  final IconData icono;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icono,
          size: 80.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          message,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
