import 'package:ecommece_app/core/utils/constans.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/style.dart';

class CustomMainTitleRow extends StatelessWidget {
  const CustomMainTitleRow(
      {Key? key, required this.textOne, this.textTwo, this.onPressed})
      : super(key: key);
  final String textOne;
  final String? textTwo;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textOne,
          style: Style.textStyle14.copyWith(color: kTextkColor),
        ),
        (textTwo != null)?
             TextButton(
          onPressed: onPressed,
          child: Text(
            "$textTwo",
            style: Style.textStyle14.copyWith(color: kPrimaryColor),
          ),
        ):
            const SizedBox(),
      ],
    );
  }
}
