import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/home/presentation/manager/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../home/presentation/view/widgets/custom_search_appbar_widget.dart';
import '../../../../regis/presentation/views/widgets/custom_text_form_faild_widget.dart';

class ExploreBody extends StatelessWidget {
  ExploreBody();
  final TextEditingController search = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: widthScreen,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Form(
                  key: _key,
                  child: CustomSearchAppBar(
                    customTextFormField: CustomTextFormFaild(
                      onFieldSubmitted: (s) {
                        if (_key.currentState!.validate()) {
                          context
                              .read<SearchCubit>()
                              .searchProduct(search.text);
                        }
                      },
                      textEditingController: search,
                      hintText: "Search Product",
                      obscureText: false,
                      prefixIcon: Icon(Icons.search),
                      validator: (text) {
                        if (text!.isEmpty) {
                          return "enter TextTo search";
                        }
                        return null;
                      },
                    ),
                    iconOne: IconButton(
                      icon: Icon(Icons.favorite_border_outlined),
                      color: kDescriptionText,
                      iconSize: 25,
                      onPressed: () {},
                    ),
                    iconTwo: IconButton(
                      icon: Icon(Icons.notifications_none_outlined),
                      iconSize: 25,
                      color: kDescriptionText,
                      onPressed: () {},
                    ),
                  ),
                ),
                BlocConsumer<SearchCubit, SearchState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is SearchSuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: state.searchModel.data.data.length,
                        itemBuilder: (context, index) {
                          final id = state.searchModel.data.data[index].id;
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Container(
                              height: 120,
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      Image(
                                        image: NetworkImage(
                                          state.searchModel.data.data[index]
                                              .image,
                                        ),
                                        height: 120,
                                        width: 120,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.searchModel.data.data[index]
                                              .name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Style.textStyle11,
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              state.searchModel.data.data[index]
                                                  .price
                                                  .toString(),
                                              style: Style.textStyle12.copyWith(
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (state is SearchLoading) {
                      return SizedBox(
                          width: widthScreen,
                          height: heightScreen,
                          child: Center(child: CircularProgressIndicator()));
                    }
                    return SizedBox(
                        width: widthScreen,
                        height: heightScreen,
                        child: Center(
                            child:
                                Lottie.asset("assets/animations/search.json")));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
