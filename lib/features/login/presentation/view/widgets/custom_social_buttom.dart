import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class SocialButtom extends StatelessWidget {
  SocialButtom({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });
  final String image;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      decoration: BoxDecoration(
          border: Border.all(color: kBorderColor),
          borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image.asset(
              image,
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 65,
            ),
            Text(
              text,
              style: Style.textStyle16.copyWith(color: kDescriptionText),
            ),
          ],
        ),
      ),
    );
  }
}
