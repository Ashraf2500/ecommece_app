import 'package:flutter/material.dart';

import 'custom_info_one_product.dart';

class CustomListOfInfoProduct extends StatelessWidget {
  const CustomListOfInfoProduct({
    Key? key,
    required this.image,
    required this.title,
    required this.newPrice,
    required this.oldPrice,
    required this.sale,
    this.icon,
    this.onPressed,


  }) : super(key: key);

  final String image ;
  final String title ;
  final double newPrice ;
  final double oldPrice ;
  final int sale ;
  final Icon? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      width: widthScreen,
      height: 210,
      padding: EdgeInsets.only(left: 10),
      child: ListView.builder(
        scrollDirection:Axis.horizontal,
        itemCount: 6 ,
        itemBuilder: (context , index){
          return CustomInfoOneProduct(
            image: "$image",
            title: "$title",
            newPrice: newPrice,
            oldPrice: oldPrice,
            sale: sale,
            icon: icon,
            onPressed: onPressed,
          );
        },
      ),
    );
  }
}
