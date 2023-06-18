import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_fav_product.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_product_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/utils/shimmar/custom_grid_view_loading.dart';
import '../../manager/bannersandgridview/home_cubit.dart';
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
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Super Flash Sale",
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
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

                      Text("There are no products on your favorites",
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
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
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
                                      return CustomGridViewLoading();
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
                      return CustomGridViewLoading();
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
