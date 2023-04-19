import 'package:ecommece_app/features/home/presentation/view/widgets/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constans.dart';
import '../../../../../core/utils/style.dart';

class CustomInfoOneProduct extends StatelessWidget {
  const CustomInfoOneProduct({
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
    return Container(
      width: 141,
    

      decoration: BoxDecoration(
          color:kBackGroundColor ,
          border: Border.all(color:kBorderColor),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Container(
                height: 120,
                width: 120,
                child: Image(image: AssetImage("$image")),
              ),
              onTap: (){
                Get.to(() => ProductBody());
              },
            ),
            /*Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image(image: AssetImage("$image",),fit: BoxFit.cover,),
                ),
            ),*/
      
            Text("$title",style:Style.textStyle11,),
            SizedBox(height: 10,),
      
            Text("$newPrice",style:Style.textStyle12.copyWith(color:kPrimaryColor, fontWeight: FontWeight.w700),),
            SizedBox(height: 5,),
      
            Row(
              children: [
                Text("$oldPrice",style:Style.textStyle11.copyWith(
                    color: kDescriptionText ,
                    fontWeight: FontWeight.w500 ,
                    decoration: TextDecoration.lineThrough),),
                SizedBox(width: 8,),
                Text("$sale %Off",style:Style.textStyle11.copyWith(color: kOfferColor),),
                (icon != null)?
                    IconButton(onPressed: onPressed, icon: icon!,):
                    SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
