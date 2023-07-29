import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text, 
  });
  final VoidCallback onPressed;
  final String text ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: Style.textStyle16.copyWith(
            color: kBackGroundColor,
          ),
        ),
      ),
    );
  }
}
