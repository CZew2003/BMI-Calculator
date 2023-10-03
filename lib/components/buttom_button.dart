import 'package:flutter/material.dart';
import 'constants.dart';

class ButtomButton extends StatelessWidget {
  const ButtomButton({
    super.key,
    required this.onTap,
    required this.message,
  });

  final String message;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: kContainerColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        ),
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        height: kContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            message,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
