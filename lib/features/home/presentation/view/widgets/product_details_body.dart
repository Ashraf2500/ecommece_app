import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/features/explore/presentation/view/explore_view.dart';
import 'package:ecommece_app/features/home/presentation/manager/product_details/product_details_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/product_details_one.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/product_details_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../manager/product_details_two/product_details_two_cubit.dart';
import 'custom_product_appbar_widget.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({super.key,  this.name, });
final String? name ;

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
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Scrollbar(
            controller: _scrollController,
            radius: const Radius.circular(8),
            scrollbarOrientation: ScrollbarOrientation.right,
            interactive: false,
            thickness: 5,
            thumbVisibility: true,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductAppBar(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: widget.name!,
                    iconOne: const Icon(Icons.search_rounded),
                    onPressedOne: () {
                       Get.to(const ExploreView());
                    },
                    iconTwo: Image.asset("assets/images/More.png"),
                    onPressedTwo: () {
                      
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    thickness: 0.6,
                    color: kDescriptionText,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ProductDetailsTwoCubit.get(context).dataHereOrNot == true
                      ? const ProductDetailsTwo()
                      : const ProductDetailsOne()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
