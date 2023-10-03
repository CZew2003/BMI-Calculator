import 'package:flutter/material.dart';
import 'rounded_icon_button.dart';
import 'reusableCard.dart';
import 'constants.dart';

class SelectedWidgetTwoButtons extends StatefulWidget {
  const SelectedWidgetTwoButtons(
      {super.key,
      required this.mainWidget,
      required this.icon1,
      required this.icon2,
      this.func1,
      this.func2,
      required this.title});

  final Widget mainWidget;
  final IconData icon1, icon2;
  final String title;
  final Function()? func1, func2;
  @override
  State<SelectedWidgetTwoButtons> createState() =>
      _SelectedWidgetTwoButtonsState();
}

class _SelectedWidgetTwoButtonsState extends State<SelectedWidgetTwoButtons> {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      myColor: kActiveCardColor,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: kLabelTextStyle,
          ),
          widget.mainWidget,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedIconButton(
                icono: widget.icon1,
                onPressed: widget.func1,
              ),
              const SizedBox(
                width: 20.0,
              ),
              RoundedIconButton(
                icono: widget.icon2,
                onPressed: widget.func2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
