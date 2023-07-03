import 'dart:async';
import 'package:ecommece_app/core/utils/app_router.dart';
import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/core/utils/shared/cache_helber.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    Future.delayed(const Duration(seconds: 2), ()async {
      final token = await CacheHelber.getData(key: "token");
      if (token != null) {
        
        // ignore: use_build_context_synchronously
        GoRouter.of(context).pushReplacement(AppRouer.KBottomBarView);
      } else {
       
       // ignore: use_build_context_synchronously
       GoRouter.of(context).pushReplacement(AppRouer.KRegisView);
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
