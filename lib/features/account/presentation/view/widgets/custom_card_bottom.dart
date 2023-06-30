import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomButtonCard extends StatelessWidget {
  const CustomButtonCard({
    super.key,
    required this.onPressed,
    required this.text,
    required this.image,
    this.textTwo,
  });
  final VoidCallback onPressed;
  final String text;
  final String image;
  final String? textTwo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kBackGroundColor,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Image.asset(image),
            const SizedBox(
              width: 16,
            ),
            Text(
              text,
              style: Style.textStyle16.copyWith(
                color: kTextkColor,
              ),
            ),
            const Spacer(),
            if (textTwo != null)
              Text(
                textTwo!,
                style: Style.textStyle16.copyWith(
                  color: kTextkColor,
                ),
              )
            else
              const SizedBox()
          ],
        ),
      ),
    );
  }
}
