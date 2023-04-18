import 'package:flutter/material.dart';

import '../../../../../constans.dart';
import '../../../../../core/utils/style.dart';

class CustomInfoProduct extends StatelessWidget {
  const CustomInfoProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
          child: Center(
            child:Container(
              height: 40,
              width: 40,
              child: Image(image: AssetImage("assets/images/shirt.png")),
            ),
          ),
          decoration: BoxDecoration(
            color:Colors.white ,
            border: Border.all(color: Color(0xffe6ecff)),
            shape: BoxShape.circle,
          ),
        ),
        Text(
          "Man Shirt",
          style: Style.textStyle14.copyWith(
            color: kDescriptionText ,
          ),
        ),
      ],
    );
  }
}
