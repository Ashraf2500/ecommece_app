import 'package:ecommece_app/constans.dart';
import 'package:flutter/material.dart';

abstract class Style {
  static const textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: kDescriptionText,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const textStyle24 = TextStyle(
    color: kBackGroundColor,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
}
