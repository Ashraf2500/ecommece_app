import 'package:ecommece_app/core/utils/shimmar/custom_carosil_loading.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/explore/presentation/view/explore_view.dart';
import 'package:ecommece_app/features/home/presentation/manager/banners_and_grid_view/home_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_of_category.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_of_info_product.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_recommended_products.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/fav_body.dart';
import 'package:ecommece_app/features/offer/presentation/view/offer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/constans.dart';
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
            radius: const Radius.circular(8),
            scrollbarOrientation: ScrollbarOrientation.right,
            interactive: false,
            thickness: 5,
            thumbVisibility: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //---------Search AppBar -----------------------------------------
                const SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(const ExploreView());
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: kBackGroundColor,
                          border: Border.all(color: kBorderColor),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Row(
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
                      icon: const Icon(Icons.favorite_border_outlined),
                      color: kDescriptionText,
                      iconSize: 25,
                      onPressed: () {
                        Get.to(const FavBody());
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none_outlined),
                      iconSize: 25,
                      color: kDescriptionText,
                      onPressed: () {},
                    ),
                  ],
                ),
        
                //---------Divider -----------------------------------------------
                const SizedBox(height: 15),
                const Divider(
                  thickness: 0.5,
                ),
        
                //---------Slider ------------------------------------------------
                const SizedBox(height: 15),
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
                      return const CustomCarosilLoading();
                    }),
        
                //---------Category ----------------------------------------------
                const SizedBox(height: 10),
        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomMainTitleRow(
                    textOne: "Category",
                    textTwo: "More Category",
                    onPressed: () {
                     
                    },
                  ),
                ),
                const CustomListOfCategory(),
        
                //---------Flash Sale --------------------------------------------
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomMainTitleRow(
                    textOne: "Flash Sale",
                    textTwo: "See More",
                    onPressed: () {
                      Get.to(() => const OfferView());
                    },
                  ),
                ),
                CustomListOfInfoProduct(),
        
                //---------Mega  Sale --------------------------------------------
                const SizedBox(height: 10),
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
                const SizedBox(height: 30),
                const CustomRecommendedProducts(),
        
                //---------Recommended Product Grid View--------------------------
                const SizedBox(
                  height: 30,
                ),
                const CustomGridViewProducts(),
                const SizedBox(
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
