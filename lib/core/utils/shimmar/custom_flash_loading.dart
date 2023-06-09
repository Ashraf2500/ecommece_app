import 'package:ecommece_app/core/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Customflashloading extends StatelessWidget {
  const Customflashloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
     baseColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white.withOpacity(.7)
          :  kDescriptionText.withOpacity(.15),
      highlightColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.grey.shade400,
      child: Container(
        width: 141,
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.grey.shade400,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
