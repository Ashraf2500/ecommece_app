
import 'package:ecommece_app/core/utils/app_router.dart';
import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommece_app/features/home/presentation/manager/product_details/product_details_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_description_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_of_info_product.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_view_for_color_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_view_for_size_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_main_title_row_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_review_section.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_slide_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_smooth_Rating_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_title_product_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class ProductDetailsOne extends StatelessWidget {
  const ProductDetailsOne({super.key});
  final check =true;
  @override
  Widget build(BuildContext context) {
   
    double heightScreen = MediaQuery.of(context).size.height;
    final double heightSlider = heightScreen * (40 / 100);
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProductDetailsFailure) {
          return Center(
            child: Text(state.errMessages),
          );
        }
        if (state is ProductDetailsSuccess) {
          var dataLenght =
              state.productDetailsForFavoritesModel.data.images.length;
          var imageUrl = state.productDetailsForFavoritesModel.data.images
              .map((image) => image)
              .toList();
          var productName = state.productDetailsForFavoritesModel.data.name;
          var price = state.productDetailsForFavoritesModel.data.price;
          var oldPrice = state.productDetailsForFavoritesModel.data.oldPrice;
          var description =
              state.productDetailsForFavoritesModel.data.description;
          var discount = state.productDetailsForFavoritesModel.data.discount;
          var dataId = state.productDetailsForFavoritesModel.data.id;
          
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
                      onPressedOne: () {
                        
                      
                      },
                      
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SmoothRating(itemSize: 20),
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
                    const DescriptionText(
                      text: "Shown:",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const DescriptionText(
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
                     GoRouter.of(context).push(AppRouer.KReviewProductBody);
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SmoothRating(
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
                    const CustomListOfInfoProduct(),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                          text: "Add To Cart",
                          onPressed: () {
                            context.read<CartCubit>().postCart(dataId,context);
                          GoRouter.of(context).push(AppRouer.KCartView,extra: check);
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
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: CircularProgressIndicator()),
          ],
        );
      },
    );
  }



}


