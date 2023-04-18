import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/features/account/presentation/view/acount_view.dart';
import 'package:ecommece_app/features/cart/presentation/view/cart_view.dart';
import 'package:ecommece_app/features/explore/presentation/view/explore_view.dart';
import 'package:ecommece_app/features/offer/presentation/view/offer_view.dart';
import 'package:ecommece_app/features/home/presentation/view/home_view.dart';

import 'package:flutter/material.dart';

class BottomBarScreens extends StatefulWidget {
  const BottomBarScreens({Key? key}) : super(key: key);

  @override
  State<BottomBarScreens> createState() => _BottomBarScreensState();
}

class _BottomBarScreensState extends State<BottomBarScreens> {
  List<Widget> screensOfNavigatorButton = [
    HomeView(),
    ExploreView(),
    CartView(),
    OfferView(),
    AccountView(),
  ];
  int indexCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBackGroundColor,
        type: BottomNavigationBarType.fixed,
        iconSize: 27,
        currentIndex: indexCurrentIndex,
        onTap: (int index) {
          setState(() {
            indexCurrentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home", tooltip: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Explore", tooltip: "Explore"),
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
      body: screensOfNavigatorButton[indexCurrentIndex],
    );
  }
}
