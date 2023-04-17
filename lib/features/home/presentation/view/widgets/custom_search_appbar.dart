import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_text_form_faild_widget.dart';
import 'package:flutter/material.dart';

class CustomSearchAppBar extends StatelessWidget {
  CustomSearchAppBar({
    Key? key,
    required this.customTextFormField,
    this.iconOne,
    this.iconTwo,
  }) : super(key: key);
  final CustomTextFormFaild customTextFormField;
  final Widget? iconOne;
  final Widget? iconTwo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 300,
          child: customTextFormField,
        ),
        iconOne!,
        iconTwo!
      ],
    );
  }
}
