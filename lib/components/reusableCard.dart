import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key, required this.myColor, this.cardChild, this.myFunction});

  final Color myColor;
  final Widget? cardChild;

  final Function()? myFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myFunction,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: myColor,
        ),
        child: cardChild,
      ),
    );
  }
}
