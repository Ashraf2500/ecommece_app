import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/home/presentation/manager/banners_and_grid_view/home_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_fav_product.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_product_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/utils/shimmar/custom_grid_view_loading.dart';
import '../../manager/fav/fav_cubit.dart';

class FavBody extends StatefulWidget {
  const FavBody({super.key});

  @override
  State<FavBody> createState() => _FavBodyState();
}

class _FavBodyState extends State<FavBody> {
  @override
  void initState() {
    super.initState();
    context.read<FavCubit>().getFavCategory();
  }
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductAppBar(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Super Flash Sale",
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 0.7,
                color: kDescriptionText,
              ),
              ConditionalBuilder(
                condition: HomeCubit.get(context).favorite.containsValue(true),
                fallback: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset("assets/animations/favorite.json"),

                      const Text("There are no products on your favorites",
                      style: Style.textStyle16,
                      )
                    ],
                  
                  );
                },
                builder: (BuildContext context) {
                  return BlocConsumer<FavCubit, FavState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is FavFailure) {
                        return Center(
                          child: Text(state.errorMessage),
                        );
                      }

                      if (state is FavSuccess) {
                        return Row(
                          children: [
                            Container(
                              width: widthScreen,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 13,
                                  childAspectRatio: 0.11 / 0.24,
                                  mainAxisSpacing: 12,
                                ),
                                itemCount: state.favModel.data.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var data = state
                                      .favModel.data.data[index].product.image;
                                  var dataName = state
                                      .favModel.data.data[index].product.name;
                                  var dataPrice = state
                                      .favModel.data.data[index].product.price;
                                  var dataOldPrice = state.favModel.data
                                      .data[index].product.oldPrice;
                                  var dataOffer = state.favModel.data
                                      .data[index].product.discount;
                                  var dataId = state
                                      .favModel.data.data[index].product.id;
                                  return ConditionalBuilder(
                                    fallback: (context) {
                                      return const CustomGridViewLoading();
                                    },
                                    condition: state is! FavLoading,
                                    builder: (context) {
                                      return CustomFavProduct(
                                        image: data,
                                        title: dataName,
                                        newPrice: dataPrice,
                                        oldPrice: dataOldPrice,
                                        sale: dataOffer,
                                        id: dataId,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }
                      return const CustomGridViewLoading();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
