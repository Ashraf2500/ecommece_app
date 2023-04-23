import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_of_category.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_recommended_products.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/favourite_datails_body.dart';
import 'package:ecommece_app/features/offer/presentation/view/offer_view.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_text_form_faild_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_grid_view_products_widget.dart';
import 'custom_list_of_info_product.dart';
import 'custom_main_title_row_widget.dart';
import 'custom_search_appbar_widget.dart';
import 'custom_slide_widget.dart';

class HomeBody extends StatelessWidget {
   HomeBody({Key? key}) : super(key: key);
final ScrollController  _ScrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          
          controller: _ScrollController,
          radius: Radius.circular(8),
          scrollbarOrientation: ScrollbarOrientation.right,
          interactive: false,
          thickness: 5,
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //---------Search AppBar -----------------------------------------
                SizedBox(height: 10),
                CustomSearchAppBar(
                  key: key,
                  customTextFormField: CustomTextFormFaild(
                    hintText: "Search Product",
                    obscureText: false,
                    prefixIcon: Icon(Icons.search),
                    validator: (text) {},
                  ),
                  iconOne: IconButton(
                    icon: Icon(Icons.favorite_border_outlined),
                    color: kDescriptionText,
                    onPressed: () {
                      Get.to(() => FavouriteBody());
                    },
                  ),
                  iconTwo: IconButton(
                    icon: Icon(Icons.notifications_none_outlined),
                    color: kDescriptionText,
                    onPressed: () {},
                  ),
                ),
            
                //---------Divider -----------------------------------------------
                SizedBox(height: 15),
                Divider(
                  thickness: 0.5,
                ),
            
                //---------Slider ------------------------------------------------
                SizedBox(height: 15),
                CustomSlider(),
            
                //---------Category ----------------------------------------------
                SizedBox(height: 10),
                CustomMainTitleRow(
                  key: key,
                  textOne: "Category",
                  textTwo: "More Category",
                  onPressed: () {},
                ),
                CustomListOfCategory(),
            
                //---------Flash Sale --------------------------------------------
                SizedBox(height: 10),
                CustomMainTitleRow(
                  key: key,
                  textOne: "Flash Sale",
                  textTwo: "See More",
                  onPressed: () {
                    Get.to(() => OfferView());
                  },
                ),
                CustomListOfInfoProduct(
                  image: "assets/images/product.png",
                  title: "FS - Nike Air React...",
                  newPrice: 299.43,
                  oldPrice: 534.33,
                  sale: 24,
                ),
            
                //---------Mega  Sale --------------------------------------------
                SizedBox(height: 10),
                CustomMainTitleRow(
                  key: key,
                  textOne: "Mega Sale",
                  textTwo: "See More",
                  onPressed: () {},
                ),
                CustomListOfInfoProduct(
                  image: "assets/images/product2.png",
                  title: "FS - Nike Air React...",
                  newPrice: 299.43,
                  oldPrice: 534.33,
                  sale: 24,
                ),
            
                //---------Recommended Product -----------------------------------
                SizedBox(height: 30),
                CustomRecommendedProducts(),
            
                //---------Recommended Product Grid View--------------------------
                SizedBox(height: 30,),
                CustomGridViewProducts(),
            SizedBox(height: 14,)
            
              ],
            
              //CustomMainTitle();
            ),
          ),
        ),
      ),
    );
  }
}
