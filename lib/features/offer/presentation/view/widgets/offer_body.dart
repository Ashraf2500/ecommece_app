import 'package:ecommece_app/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constans.dart';
import '../../../../home/presentation/view/widgets/custom_grid_view_products_widget.dart';
import '../../../../home/presentation/view/widgets/custom_product_appbar_widget.dart';

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
              const SizedBox(height: 5),
              ProductAppBar(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Get.to(() => const HomeView());
                },
                text: "Super Flash Sale",
                iconTwo: const Icon(Icons.search,color: kDescriptionText,),



              ),

              //---------Divider -----------------------------------------------
              const SizedBox(height: 5),
              const Divider(
                thickness: 0.4,
              ),


              //---------Slider ------------------------------------------------
              const SizedBox(height: 15),
              // CustomSlider(),

              //---------Recommended Product Grid View--------------------------
              const SizedBox(height: 20,),
              const CustomGridViewProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
