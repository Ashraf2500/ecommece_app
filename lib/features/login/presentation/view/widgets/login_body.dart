import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommece_app/core/utils/app_router.dart';
import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/core/utils/shared/cache_helber.dart';
import 'package:ecommece_app/features/login/presentation/manager/login/login_cubit.dart';
import 'package:ecommece_app/features/login/presentation/view/widgets/custom_divider_widget.dart';
import 'package:ecommece_app/features/login/presentation/view/widgets/custom_social_buttom.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Button_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Text_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_text_form_faild_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/constans.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit()..obsucureText(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      if (state.loginModel.status) {
                        CacheHelber.saveData(
                            key: "token", value: state.loginModel.data!.token);
                    Fluttertoast.showToast(msg: state.loginModel.message,textColor: Colors.white,
                     backgroundColor: kGreenColor
                    );
                       
                        

                        GoRouter.of(context).pushReplacement(AppRouer.KBottomBarView);
                      } else {
                        Fluttertoast.showToast(msg: state.loginModel.message,textColor: Colors.white,
                         backgroundColor: kRedColor
                        );
                         
                        
                      }
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 68,
                        ),
                        Image.asset(
                          Images.logo,
                          width: 72,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const CustomTitle(
                          textOne: "Welcome to Lafyuu",
                          textTwo: "Sign in to continue",
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        CustomTextFormFaild(
                          textEditingController: emailController,
                          hintText: "Your Email",
                          obscureText: false,
                          validator: (text) {
                            return null;
                          },
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormFaild(
                          textEditingController: PasswordController,
                          hintText: "Password",
                          obscureText: LoginCubit.get(context).obscureText,
                          validator: (text) {
                            return null;
                          },
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                              onPressed: () {
                                LoginCubit.get(context).obsucureText();
                              },
                              icon: LoginCubit.get(context).obscureText
                                  ? const Icon(Icons.visibility_off_outlined)
                                  : const Icon(Icons.visibility_outlined)),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoading,
                          builder: (context) => CustomButton(
                            text: "Sign In",
                            onPressed: () {
                              LoginCubit.get(context).postData(
                                email: emailController.text,
                                password: PasswordController.text,
                              );
                            },
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        const CustomDivider(),
                        const SizedBox(
                          height: 16,
                        ),
                        SocialButtom(
                          image: Images.google,
                          text: "Login with Google",
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SocialButtom(
                          image: Images.faceBook,
                          text: "Login with FaceBook",
                          onTap: () {},
                        ),
                        const SizedBox(
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
                           GoRouter.of(context).push(AppRouer.KRegisView);
                          },
                          textButton: "Register",
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
