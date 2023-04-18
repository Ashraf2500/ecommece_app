import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {

  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kBackGroundColor,
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: ProductBody(),
    );
  }
}
