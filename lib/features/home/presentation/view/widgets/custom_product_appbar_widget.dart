import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';


class ProductAppBar extends StatelessWidget {
  const ProductAppBar(
      {super.key,
       this.icon,
      required this.text,
       this.iconOne,
       this.iconTwo,
       this.onPressed,
       this.onPressedOne,
       this.onPressedTwo, });
  final Widget? icon;
  final String text;
  final Widget? iconOne;
  final Widget? iconTwo;
 
  final VoidCallback? onPressed;
  final VoidCallback? onPressedOne;
  final VoidCallback? onPressedTwo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
         icon != null?  IconButton(onPressed: onPressed, icon: icon!,color: kDescriptionText,):const SizedBox(width: 30,),
            SizedBox(
              width: 190,
              height: 35,
              child: SizedBox(
                height: 10,
                child: Text(text,style: Style.textStyle16.copyWith(color: kTextkColor),
                           textAlign: TextAlign.start,
                maxLines: 2,
                  overflow: TextOverflow.ellipsis,),
              ),
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
