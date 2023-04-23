import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/features/home/data/repo/banners_repo_impl.dart';
import 'package:ecommece_app/features/home/presentation/manager/cubit/banners_cubit.dart';
import 'package:ecommece_app/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {

  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) =>  BannersCubit(BannerImpl())..getData(),),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: kBackGroundColor,
            textTheme: GoogleFonts.poppinsTextTheme()),
        home: HomeView(),
      ),
    );
  }
}
