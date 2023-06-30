import 'package:ecommece_app/core/utils/constans.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit/bottom_bar_cubit.dart';

class BottomBarScreens extends StatelessWidget {
  const BottomBarScreens({Key? key, this.index}) : super(key: key);
  final int? index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomBarCubit, BottomBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: kBackGroundColor,
            type: BottomNavigationBarType.fixed,
            iconSize: 27,
            currentIndex:  BottomBarCubit.get(context).currentIndex,
            onTap: (int index) {
              BottomBarCubit.get(context).navScreen(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Home", tooltip: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Explore",
                  tooltip: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: "Cart",
                  tooltip: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_offer_outlined),
                  label: "Offer",
                  tooltip: "Offer"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: "Account",
                  tooltip: "Account"),
            ],
          ),
          body:
              BottomBarCubit.get(context).screensOfNavigatorButton[
                  BottomBarCubit.get(context).currentIndex],
        );
      },
    );
  }
}
