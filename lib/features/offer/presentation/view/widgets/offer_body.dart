import 'package:ecommece_app/features/offer/presentation/view/widgets/horizontal_coupon.dart';
import 'package:flutter/material.dart';
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
              const SizedBox(height: 5),
              const ProductAppBar(
                text: "Offer",
              ),

              //---------Divider -----------------------------------------------
              const SizedBox(height: 5),
              const Divider(
                thickness: 0.4,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: HorizontalCouponExample1(),
              ),
              const SizedBox(height: 14),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                    Image.asset("assets/images/shoe1.png"),
                    timeSaleSlider("Super Flash Sale","50% Off",true)
                  ],
                ),
              ),
              const SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Stack(
                  children: [
                    Image.asset("assets/images/recommended.png"),
                    timeSaleSlider("90% Off Super Mega","sale",false)
                  ],
                              ),
                ),

              //---------Slider ------------------------------------------------

              // CustomSlider(),

              //---------Recommended Product Grid View--------------------------
            ],
          ),
        ),
      ),
    );
  }
}
