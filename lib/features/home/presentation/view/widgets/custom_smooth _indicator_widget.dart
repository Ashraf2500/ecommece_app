import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../../../constans.dart';

class CustomSmoothIndicator extends StatelessWidget {
  const CustomSmoothIndicator({Key? key , required this.activeIndex}) : super(key: key);
  final int activeIndex ;
  @override
  Widget build(BuildContext context) {
    return  AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count:9,
      effect: const WormEffect(
        dotWidth: 9,
        dotHeight: 9,
        activeDotColor: kPrimaryColor,
        dotColor: kBorderColor,
        spacing: 7,

      ),

    );
  }
}
