import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/home/data/model/size_model.dart';
import 'package:flutter/material.dart';

class ListViewSize extends StatelessWidget {
   ListViewSize({super.key});

 List<SizeModel> sizeNumber = [
      SizeModel(numder: "6"),
       SizeModel(numder: "6.5"),
       SizeModel(numder: "7"),
       SizeModel(numder: "7.5"),
       SizeModel(numder: "8"),
       SizeModel(numder: "8.5"),
    ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount:sizeNumber.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: kTextkColor,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: kBackGroundColor,
                child: Text(
                  "${sizeNumber[index].numder}",
                  style: Style.textStyle14.copyWith(color: kTextkColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

