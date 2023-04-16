import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomTextFormFaild extends StatelessWidget {
  CustomTextFormFaild(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      required this.obscureText,
      this.suffixIcon,
      this.onPressed,
     required this.validator
      });
  final Widget? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final VoidCallback? onPressed;
   var validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: Style.textStyle12,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: kBorderColor)
          ),
        ),
      ),
    );
  }
}
