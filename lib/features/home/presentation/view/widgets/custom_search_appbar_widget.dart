import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_text_form_faild_widget.dart';
import 'package:flutter/material.dart';

class CustomSearchAppBar extends StatelessWidget {
  const CustomSearchAppBar({
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
        SizedBox(
          width: 290,
          child: customTextFormField,
        ),
        iconOne != null ? IconButton(onPressed: (){}, icon: iconOne!):const SizedBox() ,
        iconTwo !=null ? IconButton(onPressed: (){}, icon: iconTwo!): const SizedBox(),
      ],
    );
  }
}
