import 'package:ecommece_app/core/utils/constans.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/style.dart';

class CustomTitleProduct extends StatelessWidget {
  const CustomTitleProduct(
      {Key? key, required this.text, this.onPressedOne, this.icon})
      : super(key: key);
  final String text;

  final VoidCallback? onPressedOne;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Style.textStyle20.copyWith(
                color: kTextkColor,
              ),
            ),
          ),
          icon != null
              ? IconButton(
                  onPressed: onPressedOne,
                  icon: icon!,
                  color: kDescriptionText,
                )
              : const SizedBox()
        ]);
  }
}
