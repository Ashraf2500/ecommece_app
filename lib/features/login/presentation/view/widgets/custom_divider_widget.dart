import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: kBorderColor,
              thickness: 1.4,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "OR",
            style: Style.textStyle14.copyWith(color: kDescriptionText),
          ),
          const SizedBox(
            width: 20,
          ),
          const Expanded(
            child: Divider(
              color: kBorderColor,
              thickness: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
