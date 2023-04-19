import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_view_for_color_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_list_view_for_size_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_main_title_row_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_review_section.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_slide_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_smooth_Rating_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_title_product_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/review_product_body.dart';
import 'package:flutter/material.dart';
import '../../../../regis/presentation/views/widgets/custom_Button_widget.dart';
import 'custom_description_widget.dart';
import 'custom_list_of_info_product.dart';
import 'custom_product_appbar_widget.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
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
                  iconTwo: Icon(Icons.info_outline_rounded),
                  onPressedTwo: () {},
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 0.7,
                  color: kDescriptionText,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomSlider(),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTitleProduct(
                        text: "Nike Air Zoom Pegasus 36\nMiami",
                        onPressedOne: () {},
                        icon: Icon(Icons.favorite_border_outlined),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SmoothRating(),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "\$299,43",
                        style: Style.textStyle20.copyWith(color: kPrimaryColor),
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
                        textOne: "Laser",
                        textTwo: "Blue/Anthracite/Watermel",
                        textThere: "on/White",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DescriptionText(
                        text: "Style:",
                        textOne: "CD0113-400",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DescriptionText(
                        text:
                            "The Nike Air Max 270 React ENG combines a\nfull-length React foam midsole with a 270 Max Air\nunit for unrivaled comfort and a striking visual\nexperience.",
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
                      SmoothRating(textOne: "4.5", textTwo: "(5 Review)"),
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
                      CustomListOfInfoProduct(
                        image: "assets/images/product.png",
                        title: "FS - Nike Air React...",
                        newPrice: 299.43,
                        oldPrice: 534.33,
                        sale: 24,
                      ),
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
            ),
          ),
        ),
      ),
    );
  }
}
