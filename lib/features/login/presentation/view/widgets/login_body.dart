import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/features/login/presentation/view/widgets/custom_divider_widget.dart';
import 'package:ecommece_app/features/login/presentation/view/widgets/custom_social_buttom.dart';
import 'package:ecommece_app/features/regis/presentation/views/regis_view.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Button_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Text_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_text_form_faild_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main_Screens/bottom_bar_screens.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 68,
                ),
                Image.asset(
                  Images.logo,
                  width: 72,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTitle(
                  textOne: "Welcome to Lafyuu",
                  textTwo: "Sign in to continue",
                ),
                SizedBox(
                  height: 28,
                ),
                CustomTextFormField(
                  hintText: "Your Email",
                  obscureText: false,
                  validator: (text) {},
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  hintText: "Password",
                  obscureText: obscureText,
                  validator: (text) {},
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: obscureText
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility_outlined)),
                ),
                SizedBox(
                  height: 16,
                ),
                CustomButton(
                  text: "Sign In",
                  onPressed: () {
                     Get.to( () => BottomBarScreens() );
                    },
                ),
                SizedBox(
                  height: 21,
                ),
                CustomDivider(),
                SizedBox(
                  height: 16,
                ),
                SocialButtom(
                  image: Images.google,
                  text: "Login with Google",
                  onTap: () {},
                ),
                SizedBox(
                  height: 16,
                ),
                SocialButtom(
                  image: Images.faceBook,
                  text: "Login with FaceBook",
                  onTap: () {},
                ),
                SizedBox(
                  height: 16,
                ),
                CustomText(
                  onPressed: () {},
                  textButton: "Forgot Password?",
                  text: "",
                ),
                
                CustomText(
                  text: "Don’t have a account?",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      
                      return RegisView();
                    },));
                  },
                  textButton: "Register",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
