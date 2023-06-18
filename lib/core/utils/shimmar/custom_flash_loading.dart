import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Customflashloading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
     baseColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white.withOpacity(.7)
          : Colors.grey.withOpacity(.7),
      highlightColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.grey.shade300,
      child: Container(
        width: 141,
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.grey.shade300,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}