import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';


class ProductAppBar extends StatelessWidget {
  const ProductAppBar(
      {super.key,
      required this.icon,
      required this.text,
       this.iconOne,
       this.iconTwo,
      required this.onPressed,
       this.onPressedOne,
       this.onPressedTwo});
  final Widget icon;
  final String text;
  final Widget? iconOne;
  final Widget? iconTwo;
  final VoidCallback onPressed;
  final VoidCallback? onPressedOne;
  final VoidCallback? onPressedTwo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(onPressed: onPressed, icon: icon,color: kDescriptionText,),
            SizedBox(
              width: 190,
              child: Text(text,style: Style.textStyle16.copyWith(color: kTextkColor),
              maxLines: 2,
                overflow: TextOverflow.ellipsis,),
            ),
          ],
        ),

       Row(
         children: [
           iconOne != null? IconButton(onPressed: onPressedOne, icon: iconOne!,color: kDescriptionText):const SizedBox(),
           iconTwo != null? IconButton(onPressed: onPressedTwo, icon: iconTwo!,color: kDescriptionText):const SizedBox(),
         ],
       )

      ],
    );
  }
}
