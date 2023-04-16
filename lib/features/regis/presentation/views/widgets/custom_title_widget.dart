import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          "Let ’s Get Started",
          style: Style.textStyle16.copyWith(color: kTextkColor),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Create an new account",
          style: Style.textStyle12.copyWith(),
        ),
      ],
    );
  }
}
