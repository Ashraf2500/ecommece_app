
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_info_one_product.dart';
import 'package:flutter/material.dart';

class CustomGridViewProducts extends StatelessWidget {
  const CustomGridViewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;


    return Container(
      width: widthScreen,
      height: heightScreen*.8,
     padding: EdgeInsets.symmetric(horizontal: 16),
    
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),

      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            childAspectRatio: 1/1.25,
            mainAxisSpacing: 16,

          ),
          itemCount:10,
          itemBuilder: (BuildContext context, int index) {
            return CustomInfoOneProduct(
              image: "assets/images/product.png",
              title: "FS - Nike Air React...",
              newPrice: 299.43,
              oldPrice: 534.33,
              sale: 24,
            );
          }
      ),
    );
  }
}
