import 'package:ecommece_app/constans.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/splach/presentation/views/splash_view.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: kBackGroundColor,
          textTheme: GoogleFonts.poppinsTextTheme()
          ),
          
      home: SplashView(),
    );
  }
}
