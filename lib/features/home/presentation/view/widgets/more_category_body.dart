import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/features/explore/presentation/view/explore_view.dart';
import 'package:ecommece_app/features/home/presentation/manager/more_category/more_category_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/home_view.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_product_appbar_widget.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../manager/product_details_two/product_details_two_cubit.dart';

class MoreCategotyBody extends StatelessWidget {
  const MoreCategotyBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: BlocConsumer<MoreCategoryCubit, MoreCategoryState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MoreCategoryFailure) {
              return Center(child: Text(state.errorMessage));
            }
            if (state is MoreCategorySuccess) {
              var dataLength = state.moreCategoryModel.length;
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductAppBar(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          onPressed: () {
                            Get.to(() => const HomeView());
                          },
                          text: "More Category",
                          iconTwo: const Icon(
                            Icons.search,
                            color: kDescriptionText,
                          ),
                          onPressedTwo: (){
                             Get.to(const ExploreView());
                          },
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dataLength,
                            itemBuilder: (context, index) {
                              String dataImage =
                                  state.moreCategoryModel[index].images[index];
                                 
                              String dataName =
                                  state.moreCategoryModel[index].title;
                                  
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 25),
                                child: InkWell(
                                  onTap: () {
                                    ProductDetailsTwoCubit.get(context).getProductDetailsTwo(id: state.moreCategoryModel[index].id);
                                    ProductDetailsTwoCubit.get(context).dataishers(true);

                                     Navigator.push(context, MaterialPageRoute(builder: (context) => ProductBody(name: dataName),));
                                  },
                                  child: categoryListView(dataImage, dataName)),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget categoryListView(String dataImage, String dataName) {
    return Column(
      children: [
        const Divider(
          thickness: 0.5,
        ),
        Row(
          children: [
            Image(
              image: NetworkImage(dataImage),
              width: 80,
              height: 80,
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 190,
              child: Text(dataName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_rounded,
                    color: kDescriptionText))
          ],
        ),
      ],
    );
  }
}
