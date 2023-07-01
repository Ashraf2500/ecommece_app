import 'package:ecommece_app/core/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomCarosilLoading extends StatelessWidget {
  const CustomCarosilLoading({super.key});

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white.withOpacity(.7)
          :  kDescriptionText.withOpacity(.15),
      highlightColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.grey.shade400,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AspectRatio(
           aspectRatio: 20 / 9,
          child: Container(
          
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.grey.shade400,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }
}
