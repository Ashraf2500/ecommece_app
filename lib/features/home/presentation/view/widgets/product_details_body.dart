import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/home/presentation/manager/product_details/product_details_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_view_for_color_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_view_for_size_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_main_title_row_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_review_section.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_slide_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_smooth_Rating_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_title_product_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/review_product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../regis/presentation/views/widgets/custom_Button_widget.dart';
import 'custom_description_widget.dart';
import 'custom_list_of_info_product.dart';
import 'custom_product_appbar_widget.dart';

class ProductBody extends StatefulWidget {
  ProductBody({super.key, this.id});
int? id;
  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
  
    super.initState();

    context.read<ProductDetailsCubit>().getproductDetailsForFav();
  }

  @override
  Widget build(BuildContext context) {
        double heightScreen = MediaQuery.of(context).size.height;
 final double heightSlider = heightScreen * (40 / 100);
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Scrollbar(
            controller: _scrollController,
            radius: Radius.circular(8),
            scrollbarOrientation: ScrollbarOrientation.right,
            interactive: false,
            thickness: 5,
            thumbVisibility: true,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductAppBar(
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "Nike Air Max 270 Rea...",
                    iconOne: Icon(Icons.search_rounded),
                    onPressedOne: () {},
                    iconTwo: Image.asset("assets/images/More.png"),
                    onPressedTwo: () {},
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    thickness: 0.6,
                    color: kDescriptionText,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is ProductDetailsFailure) {
                        return Center(
                          child: Text(state.errMessages),
                        );
                      }
                      if (state is ProductDetailsSuccess) {
                        var dataLenght = state
                            .productDetailsForFavoritesModel.data.images.length;
                        var imageUrl = state
                            .productDetailsForFavoritesModel.data.images
                            .map((image) => image)
                            .toList();
                        var productName =
                            state.productDetailsForFavoritesModel.data.name;
                        var price =
                            state.productDetailsForFavoritesModel.data.price;
                        var oldPrice =
                            state.productDetailsForFavoritesModel.data.oldPrice;
                        var description = state
                            .productDetailsForFavoritesModel.data.description;
                        var discount =
                            state.productDetailsForFavoritesModel.data.discount;

                        return Column(
                          children: [
                            CustomSlider(
                              heightSlider:heightSlider ,
                              data: imageUrl,
                              dataLenght: dataLenght,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTitleProduct(
                                    text: productName,
                                    onPressedOne: () {},
                                    icon: Icon(Icons.favorite_border_outlined),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SmoothRating(itemSize: 20),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        price.toString(),
                                        style: Style.textStyle20
                                            .copyWith(color: kPrimaryColor),
                                      ),
                                      SizedBox(width: 8),
                                      if (oldPrice !=
                                          0) // تحقق من القيمة قبل استخدامها كشرط
                                        Text(
                                          "$oldPrice",
                                          style: Style.textStyle11.copyWith(
                                            color: kDescriptionText,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      SizedBox(width: 8),
                                      if (discount !=
                                          0) // تحقق من القيمة قبل استخدامها كشرط
                                        Text(
                                          "$discount %Off",
                                          style: Style.textStyle11
                                              .copyWith(color: kOfferColor),
                                        ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  CustomMainTitleRow(
                                    textOne: "Select Size",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  ListViewSize(),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  CustomMainTitleRow(
                                    textOne: "Select Color",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  ListViewColor(),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  CustomMainTitleRow(
                                    textOne: "Specification",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  DescriptionText(
                                    text: "Shown:",
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  DescriptionText(
                                    text: "Style:",
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  DescriptionText(
                                    text: description,
                                  ),
                                  SizedBox(
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
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SmoothRating(
                                      textOne: "4.5",
                                      textTwo: "(5 Review)",
                                      itemSize: 20),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  ReviewSection(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomMainTitleRow(
                                    textOne: "You Might Also Like",
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomListOfInfoProduct(),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  CustomButton(
                                    text: "Add To Cart",
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
