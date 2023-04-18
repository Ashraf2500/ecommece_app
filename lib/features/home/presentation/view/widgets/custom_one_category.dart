import 'package:flutter/material.dart';

import '../../../../../constans.dart';
import '../../../../../core/utils/style.dart';

class CustomOneCategory extends StatelessWidget {
   CustomOneCategory({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image ;
  final String title ;

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
              child: Image(image: AssetImage("$image")),
            ),
          ),
          decoration: BoxDecoration(
            color:Colors.white ,
            border: Border.all(color: Color(0xffe6ecff)),
            shape: BoxShape.circle,
          ),
        ),
        Text(
          "$title",
          style: Style.textStyle14.copyWith(
            color: kDescriptionText ,
          ),
        ),
      ],
    );
  }
}
