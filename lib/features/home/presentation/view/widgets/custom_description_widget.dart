import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
   DescriptionText({super.key,required this.text,this.textOne,this.textThere,this.textTwo});
String text;
String? textOne;
String? textTwo;
String? textThere;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         text,
          style: Style.textStyle12.copyWith(color: kDescriptionText,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
           textOne != null? Text(
              textOne!,
              style: Style.textStyle12.copyWith(color: kDescriptionText),
            ):SizedBox(),
          textTwo != null ?  Text(
              textTwo!,
              style: Style.textStyle12.copyWith(color: kDescriptionText),
            ):SizedBox(),
            textThere != null ? Text(
              textThere!,
              style: Style.textStyle12.copyWith(color: kDescriptionText),
            ): SizedBox()
          ],
        )
      ],
    );
  }
}
