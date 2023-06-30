import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.textOne, required this.textTwo});
  final String textOne;
  final String textTwo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          textOne,
          style: Style.textStyle16.copyWith(color: kTextkColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          textTwo,
          style: Style.textStyle12.copyWith(),
        ),
      ],
    );
  }
}
