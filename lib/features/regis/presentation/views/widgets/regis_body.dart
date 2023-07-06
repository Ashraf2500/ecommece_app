import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommece_app/core/utils/app_router.dart';
import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/features/regis/presentation/manager/cubit/register_cubit.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Button_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Text_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'custom_text_form_faild_widget.dart';

class RegisBody extends StatefulWidget {
  const RegisBody({super.key});

  @override
  State<RegisBody> createState() => _RegisBodyState();
}

class _RegisBodyState extends State<RegisBody> {
  bool obscureTextOne = false;
  bool obscureTextTwo = true;
  TextEditingController textOne = TextEditingController();
  TextEditingController textTwo = TextEditingController();
  TextEditingController textThere = TextEditingController();
  TextEditingController textFour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            if (state.regisModel.status) {
              Fluttertoast.showToast(
                  msg: state.regisModel.message, textColor: Colors.white,
                  backgroundColor: kGreenColor
                  );

              GoRouter.of(context).push(AppRouer.KLoginView);
            } else {
              Fluttertoast.showToast(
                  msg: state.regisModel.message, textColor: Colors.white,
                     backgroundColor: kRedColor
                  );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        Image.asset(
                          Images.logo,
                          width: 72,
                        ),
                        const CustomTitle(
                          textOne: "Let ’s Get Started",
                          textTwo: "Create an new account",
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        CustomTextFormFaild(
                            textEditingController: textOne,
                            validator: (text) {
                              return null;
                            },
                            obscureText: false,
                            hintText: "Full Name",
                            prefixIcon: const Icon(Icons.person_2_outlined)),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormFaild(
                          textEditingController: textTwo,
                          validator: (text) {
                            return null;
                          },
                          obscureText: false,
                          hintText: "Phone Number",
                          prefixIcon: const Icon(Icons.local_phone_outlined),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormFaild(
                            textEditingController: textThere,
                            validator: (text) {
                              return null;
                            },
                            obscureText: false,
                            hintText: "Your Email",
                            prefixIcon: const Icon(Icons.email_outlined)),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormFaild(
                          textEditingController: textFour,
                          validator: (text) {
                            return null;
                          },
                          obscureText: obscureTextTwo,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureTextTwo = !obscureTextTwo;
                              });
                            },
                            icon: obscureTextTwo
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined),
                          ),
                          hintText: "Password Again",
                          prefixIcon: const Icon(Icons.lock_outlined),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoading,
                          builder: (context) => CustomButton(
                            text: "Sign Up",
                            onPressed: () {
                              BlocProvider.of<RegisterCubit>(context)
                                  .postRegister(
                                      textOne: textOne.text,
                                      textTwo: textTwo.text,
                                      textThere: textThere.text,
                                      textFour: textFour.text);
                            },
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomText(
                          text: "have a account?",
                          onPressed: () {
                            GoRouter.of(context).push(AppRouer.KLoginView);
                          },
                          textButton: "Sign In",
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
