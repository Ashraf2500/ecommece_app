import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';


class CustomTextFormFaild extends StatelessWidget {
  const CustomTextFormFaild({
    super.key,
    required this.hintText,
    this.prefixIcon,
    required this.obscureText,
    this.suffixIcon,
    this.textEditingController,
    required this.validator,
    this.onFieldSubmitted, this.keyboardType,
  });
  final Widget? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? textEditingController;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      obscureText: obscureText,
    keyboardType: keyboardType,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
      
          hintStyle: Style.textStyle12,
          focusedBorder: border(),
          border: border(),
          enabledBorder: border()),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: kBorderColor));
  }
}
