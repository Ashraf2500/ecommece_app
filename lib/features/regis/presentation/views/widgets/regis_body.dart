import 'package:ecommece_app/constans.dart';
import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_title_widget.dart';
import 'package:flutter/material.dart';

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
              children: [
                SizedBox(
                  height: 150,
                ),
                Image.asset(
                  Images.logo,
                  width: 72,
                ),
                CustomTitle(),
                SizedBox(
                  height: 28,
                ),
                CustomTextFormFaild(
                    validator: (text) {},
                    obscureText: false,
                    hintText: "Full Name",
                    prefixIcon: Icon(Icons.person_2_outlined)),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormFaild(
                    validator: (text) {},
                    obscureText: false,
                    hintText: "Your Email",
                    prefixIcon: Icon(Icons.email_outlined)),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormFaild(
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
                CustomTextFormFaild(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 57,
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: Style.textStyle16.copyWith(
                          color: kBackGroundColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
