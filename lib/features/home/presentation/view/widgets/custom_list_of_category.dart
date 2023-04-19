import 'package:ecommece_app/features/home/presentation/view/widgets/custom_one_category.dart';
import 'package:flutter/material.dart';


class CustomListOfCategory extends StatelessWidget {
  const CustomListOfCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return  Container(
      width: widthScreen,
      height: 120,
    
      child: ListView.builder(
        scrollDirection:Axis.horizontal,
        itemCount: 6 ,
        itemBuilder: (context , index){
          return CustomOneCategory(image:"assets/images/shirt.png" ,title: "Man Shirt",);
        },
      ),
    );
  }
}
