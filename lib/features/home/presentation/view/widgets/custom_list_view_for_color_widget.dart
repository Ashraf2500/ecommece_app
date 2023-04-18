import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/features/home/model/color_model.dart';
import 'package:flutter/material.dart';

class ListViewColor extends StatelessWidget {
   ListViewColor({super.key});
 List<ColorModel> selectColor = [
    ColorModel(
      color: kRatingColor,
    ),
    ColorModel(
      color: kPrimaryColor,
    ),
    ColorModel(
      color: kRedColor,
    ),
    ColorModel(
      color: kGreenColor,
    ),
    ColorModel(
      color: kBurpleColor,
    ),
    ColorModel(
      color: kTextkColor,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: selectColor.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              radius: 30,
              backgroundColor:selectColor[index].color,
              
            ),
          );
        },
      ),
    );
  }
}

