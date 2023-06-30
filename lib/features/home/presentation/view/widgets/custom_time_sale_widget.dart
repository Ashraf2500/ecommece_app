import 'package:ecommece_app/core/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:ecommece_app/core/utils/style.dart';
class CustomTimeSale extends StatelessWidget {
  const CustomTimeSale({Key? key, required this.text}) : super(key: key);
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 48,
        width: 48,
        decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.all(
              Radius.circular(8)),
        ),
        child: Center(child: Text(
          text,
          style:Style.textStyle14.copyWith(
            color: kTextkColor
          ),
        )
        ),
      ),
    );
  }
}
