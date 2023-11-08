import 'package:flutter/material.dart';

import '../utils/customColors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
        required this.onPressed,
        required this.buttonText,
        this.textColor = CustomColors.pinkColor});

  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
// TextStyle(color: Colors.pink.shade200)
