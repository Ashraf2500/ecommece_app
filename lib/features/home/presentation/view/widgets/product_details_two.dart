import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/home/presentation/manager/product_details_two/product_details_two_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_description_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_of_info_product.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_view_for_color_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_view_for_size_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_main_title_row_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_review_section.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_slide_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_smooth_Rating_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_title_product_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/review_product_body.dart';
import 'package:ecommece_app/features/main_Screens/presentation/view/widgets/bottom_bar_body.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProductDetailsTwo extends StatelessWidget {
  const ProductDetailsTwo({super.key});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    final double heightSlider = heightScreen * (40 / 100);
    return BlocConsumer<ProductDetailsTwoCubit, ProductDetailsTwoState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProductDetailsTwoFailure) {
          return Center(
            child: Text(state.errMessages),
          );
        }
        if (state is ProductDetailsTwoSuccess) {
          var dataLenght = state.productDetailsTwoModel.images.length;

          var imageUrl = state.productDetailsTwoModel.images;

          var productName = state.productDetailsTwoModel.title;
          var price = state.productDetailsTwoModel.price;
          var oldPrice = 0;
          var description = state.productDetailsTwoModel.description;
          var discount = state.productDetailsTwoModel.discountPercentage;
          return Column(
            children: [
              CustomSlider(
                heightSlider: heightSlider,
                data: imageUrl,
                dataLenght: dataLenght,
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitleProduct(
                      text: productName,
                      onPressedOne: () {},
                      icon: const Icon(Icons.favorite_border_outlined),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SmoothRating(itemSize: 20),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          price.toString(),
                          style:
                              Style.textStyle20.copyWith(color: kPrimaryColor),
                        ),
                        const SizedBox(width: 8),
                        if (oldPrice != 0) // تحقق من القيمة قبل استخدامها كشرط
                          Text(
                            "$oldPrice",
                            style: Style.textStyle11.copyWith(
                              color: kDescriptionText,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        const SizedBox(width: 8),
                        if (discount != 0) // تحقق من القيمة قبل استخدامها كشرط
                          Text(
                            "$discount %Off",
                            style:
                                Style.textStyle11.copyWith(color: kOfferColor),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomMainTitleRow(
                      textOne: "Select Size",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ListViewSize(),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomMainTitleRow(
                      textOne: "Select Color",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ListViewColor(),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomMainTitleRow(
                      textOne: "Specification",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    DescriptionText(
                      text: "Shown:",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DescriptionText(
                      text: "Style:",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DescriptionText(
                      text: description,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomMainTitleRow(
                      textOne: "Review Product",
                      textTwo: "See More",
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ReviewProductBody();
                          },
                        ));
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SmoothRating(
                        textOne: "4.5", textTwo: "(5 Review)", itemSize: 20),
                    const SizedBox(
                      height: 16,
                    ),
                    const ReviewSection(),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomMainTitleRow(
                      textOne: "You Might Also Like",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomListOfInfoProduct(),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                      text: "Add To Cart",
                      onPressed: () {
                        Get.to(const BottomBarScreens(
                          index: 2,
                        ));
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
              color: Colors.red,
            )),
          ],
        );
      },
    );
  }
}
