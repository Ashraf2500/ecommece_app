import 'package:ecommece_app/core/utils/shimmar/custom_carosil_loading.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/explore/presentation/view/explore_view.dart';
import 'package:ecommece_app/features/home/presentation/manager/bannersandgridview/home_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_of_category.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_of_info_product.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_recommended_products.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/fav_body.dart';
import 'package:ecommece_app/features/offer/presentation/view/offer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../../constans.dart';
import 'custom_grid_view_products_widget.dart';
import 'custom_main_title_row_widget.dart';
import 'custom_slide_widget.dart';

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);
 final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    final double heightSlider = heightScreen * (21 / 100);
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
            controller: _scrollController,
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
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(ExploreView());
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: kBackGroundColor,
                          border: Border.all(color: kBorderColor),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              width: 10.5,
                            ),
                            Text(
                              "Search Product",
                              style: Style.textStyle12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite_border_outlined),
                      color: kDescriptionText,
                      iconSize: 25,
                      onPressed: () {
                        Get.to(FavBody());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications_none_outlined),
                      iconSize: 25,
                      color: kDescriptionText,
                      onPressed: () {},
                    ),
                  ],
                ),
        
                //---------Divider -----------------------------------------------
                SizedBox(height: 15),
                Divider(
                  thickness: 0.5,
                ),
        
                //---------Slider ------------------------------------------------
                SizedBox(height: 15),
                BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is HomeFailure) {
                        return Center(
                          child: Text(state.errorMessage),
                        );
                      }
                      if (state is HomeSuccess) {
                        var dataLenght = state.homeModel!.data.banners.length;
                        var imageUrls = state.homeModel!.data.banners
                            .map((banner) => banner.image)
                            .toList();
                        return CustomSlider(
                          heightSlider: heightSlider,
                          data: imageUrls,
                          dataLenght: dataLenght,
                        );
                      }
                      return CustomCarosilLoading();
                    }),
        
                //---------Category ----------------------------------------------
                SizedBox(height: 10),
        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomMainTitleRow(
                    textOne: "Category",
                    textTwo: "More Category",
                    onPressed: () {
                     
                    },
                  ),
                ),
                CustomListOfCategory(),
        
                //---------Flash Sale --------------------------------------------
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomMainTitleRow(
                    textOne: "Flash Sale",
                    textTwo: "See More",
                    onPressed: () {
                      Get.to(() => OfferView());
                    },
                  ),
                ),
                CustomListOfInfoProduct(),
        
                //---------Mega  Sale --------------------------------------------
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomMainTitleRow(
                    textOne: "Mega Sale",
                    textTwo: "See More",
                    onPressed: () {},
                  ),
                ),
                // CustomListOfInfoProduct(
                //   image: "assets/images/product2.png",
                //   title: "FS - Nike Air React...",
                //   newPrice: 299.43,
                //   oldPrice: 534.33,
                //   sale: 24,
                // ),
        
                //---------Recommended Product -----------------------------------
                SizedBox(height: 30),
                CustomRecommendedProducts(),
        
                //---------Recommended Product Grid View--------------------------
                SizedBox(
                  height: 30,
                ),
                CustomGridViewProducts(),
                SizedBox(
                  height: 14,
                )
              ],
        
              //CustomMainTitle();
            ),
          ),
        ),
      ),
    );
  }
}
