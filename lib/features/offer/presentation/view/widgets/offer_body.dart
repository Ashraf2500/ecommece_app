import 'package:ecommece_app/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constans.dart';
import '../../../../home/presentation/view/widgets/custom_grid_view_products_widget.dart';
import '../../../../home/presentation/view/widgets/custom_product_appbar_widget.dart';
import '../../../../home/presentation/view/widgets/custom_slide_widget.dart';

class OfferBody extends StatelessWidget {
  const OfferBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              //---------ProductAppBar ----------------------------------------
              SizedBox(height: 5),
              ProductAppBar(
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Get.to(() => HomeView());
                },
                text: "Super Flash Sale",
                iconTwo: Icon(Icons.search,color: kDescriptionText,),



              ),

              //---------Divider -----------------------------------------------
              SizedBox(height: 5),
              Divider(
                thickness: 0.4,
              ),


              //---------Slider ------------------------------------------------
              SizedBox(height: 15),
              CustomSlider(),

              //---------Recommended Product Grid View--------------------------
              SizedBox(height: 20,),
              CustomGridViewProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
