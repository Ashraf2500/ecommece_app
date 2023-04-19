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
      height: 220,
    
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection:Axis.horizontal,
        itemCount: 6 ,
        itemBuilder: (context , index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomInfoOneProduct(
              image: "$image",
              title: "$title",
              newPrice: newPrice,
              oldPrice: oldPrice,
              sale: sale,
              icon: icon,
              onPressed: onPressed,
            ),
          );
        },
      ),
    );
  }
}
