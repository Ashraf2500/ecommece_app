import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomRecommendedProducts extends StatelessWidget {
  const CustomRecommendedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        const Image(
          image: AssetImage("assets/images/recommended.png"), fit: BoxFit.fill,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              Text("Recommended", style: Style.textStyle24.copyWith(color:kBackGroundColor),),

              const SizedBox(height: 10,),
              Text("Products", style: Style.textStyle24.copyWith(color:kBackGroundColor),),

              const SizedBox(height: 50,),
              Text("We recommend the best for you", style: Style.textStyle12.copyWith(color:kBackGroundColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
