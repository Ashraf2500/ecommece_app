import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/features/login/presentation/view/widgets/login_body.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Button_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Text_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main_Screens/bottom_bar_screens.dart';
import 'custom_text_form_faild_widget.dart';

class RegisBody extends StatefulWidget {
  const RegisBody({super.key});

  @override
  State<RegisBody> createState() => _RegisBodyState();
}

class _RegisBodyState extends State<RegisBody> {
  bool obscureTextOne = true;
  bool obscureTextTwo = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Image.asset(
                  Images.logo,
                  width: 72,
                ),
                CustomTitle(
                  textOne: "Let ’s Get Started",
                  textTwo: "Create an new account",
                ),
                SizedBox(
                  height: 28,
                ),
                CustomTextFormField(
                    validator: (text) {},
                    obscureText: false,
                    hintText: "Full Name",
                    prefixIcon: Icon(Icons.person_2_outlined)),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    validator: (text) {},
                    obscureText: false,
                    hintText: "Your Email",
                    prefixIcon: Icon(Icons.email_outlined)),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    validator: (text) {},
                    obscureText: obscureTextOne,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureTextOne = !obscureTextOne;
                        });
                      },
                      icon: obscureTextOne
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility_outlined),
                    ),
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock_outlined)),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  validator: (text) {},
                  obscureText: obscureTextTwo,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureTextTwo = !obscureTextTwo;
                      });
                    },
                    icon: obscureTextTwo
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility_outlined),
                  ),
                  hintText: "Password Again",
                  prefixIcon: Icon(Icons.lock_outlined),
                ),
                SizedBox(
                  height: 16,
                ),
                CustomButton(
                  text: "Sign Up",
                  onPressed: () {
                    Get.to( () => BottomBarScreens() );
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                CustomText(
                  text: "have a account?",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginBody();
                      },
                    ));
                  },
                  textButton: "Sign In",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
