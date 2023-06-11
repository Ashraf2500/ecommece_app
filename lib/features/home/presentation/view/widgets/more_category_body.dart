import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/features/home/presentation/manager/more_category/more_category_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/home_view.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_product_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MoreCategotyBody extends StatelessWidget {
  const MoreCategotyBody({super.key});

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
                          icon: Icon(Icons.arrow_back_ios_new_rounded),
                          onPressed: () {
                            Get.to(() => HomeView());
                          },
                          text: "More Category",
                          iconTwo: Icon(
                            Icons.search,
                            color: kDescriptionText,
                          ),
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: dataLength,
                            itemBuilder: (context, index) {
                              String dataImage =
                                  state.moreCategoryModel[index].images[index];
                              String dataName =
                                  state.moreCategoryModel[index].title;
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 25),
                                child: categoryListView(dataImage, dataName),
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
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget categoryListView(String dataImage, String dataName) {
    return Column(
      children: [
        Divider(
          thickness: 0.5,
        ),
        Row(
          children: [
            Image(
              image: NetworkImage(dataImage),
              width: 80,
              height: 80,
            ),
            SizedBox(
              width: 20,
            ),
            Text(dataName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios_rounded,
                    color: kDescriptionText))
          ],
        ),
      ],
    );
  }
}
