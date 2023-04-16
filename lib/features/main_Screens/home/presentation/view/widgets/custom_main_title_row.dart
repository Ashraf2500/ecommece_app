import 'package:flutter/material.dart';

import '../../../../../../core/utils/style.dart';


class CustomMainTitleRow extends StatelessWidget {
  const CustomMainTitleRow({Key? key ,required this.textOne , this.textTwo,  this.onPressed}) : super(key: key);
  final String textOne ;
  final String? textTwo;
  final VoidCallback? onPressed ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
               "$textOne",
             style: Style.textStyle14_2,
          ),

          textTwo != null ?
                TextButton(
            child:  Text(
                "$textTwo",
                style: Style.textStyle14_3,
            ),
            onPressed: onPressed,
          ):
                SizedBox(),
        ],
      ),
    );
  }
}
