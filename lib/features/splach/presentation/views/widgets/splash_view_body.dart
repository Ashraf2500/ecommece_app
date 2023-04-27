import 'dart:async';
import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/core/utils/shared/cache_helber.dart';
import 'package:ecommece_app/features/main_Screens/presentation/view/bottom_bar_view.dart';
import 'package:ecommece_app/features/regis/presentation/views/regis_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();

    navigateToRegis();
  }

  void navigateToRegis() {
    Future.delayed(Duration(seconds: 2), ()async {
      final token = await CacheHelber.getData(key: "token");
      if (token != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return BottomBarView();
          },
        ));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return RegisView();
          },
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(Images.splachLogo)),
        ],
      ),
    );
  }
}
