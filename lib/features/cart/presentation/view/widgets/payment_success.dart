import 'package:ecommece_app/core/utils/app_router.dart';
import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/main_Screens/presentation/manager/cubit/bottom_bar_cubit.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Success Icon.png"),
              Text(
                "Success",
                style: Style.textStyle24
                    .copyWith(color: kTextkColor, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "thank you for shopping using lafyuu",
                style: Style.textStyle12.copyWith(color: kTextkColor),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                  onPressed: () {
                    BottomBarCubit.get(context).navScreen(0);
                    GoRouter.of(context).pushReplacement(AppRouer.KBottomBarView);
                  },
                  text: "Back To Order")
            ],
          ),
        ),
      ),
    );
  }
}
