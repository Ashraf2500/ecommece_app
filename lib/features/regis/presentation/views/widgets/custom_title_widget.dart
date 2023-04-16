import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
   CustomTitle({super.key,required this.textOne,required this.textTwo});
String textOne;
String textTwo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          textOne,
          style: Style.textStyle16.copyWith(color: kTextkColor),
        ),
        SizedBox(
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
