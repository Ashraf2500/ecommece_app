import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
    required  this.text,
      required this.textButton,
      required this.onPressed});
  String text;
  String textButton;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(onPressed: onPressed, child: Text(textButton))
      ],
    );
  }
}
