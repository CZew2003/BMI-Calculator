import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({super.key, required this.icono, this.onPressed});

  final IconData icono;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: kButtonColor,
      elevation: 6.0,
      child: FaIcon(icono),
    );
  }
}
