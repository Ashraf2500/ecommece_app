import 'package:ecommece_app/features/home/presentation/view/widgets/custom_one_category.dart';
import 'package:flutter/material.dart';

import '../../../../../constans.dart';
import '../../../../../core/utils/style.dart';


class CustomCategories extends StatelessWidget {
  const CustomCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return  Container(
      width: widthScreen,
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 10,),
      child: Expanded(
        child: ListView.builder(
          scrollDirection:Axis.horizontal,
          itemCount: 6 ,
          itemBuilder: (context , index){
            return CustomOneCategory();
          },
        ),
      ),
    );
  }
}
