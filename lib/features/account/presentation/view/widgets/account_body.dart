import 'package:ecommece_app/core/utils/app_router.dart';
import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/account/presentation/view/widgets/custom_card_bottom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
   
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          leadingWidth: 100,
          backgroundColor: const Color(0xffFFFFFF),
          leading: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                "Account",
                style: Style.textStyle16.copyWith(
                  fontWeight: FontWeight.w700,
                  color: kTextkColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )),
      body: SafeArea(
          child: SizedBox(
        width: widht,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomButtonCard(
                onPressed: () {
                 GoRouter.of(context).push(AppRouer.KProfileBody);
                },
                text: "Profile",
                image: Images.user,
              ),
              CustomButtonCard(
                onPressed: () {},
                text: "Order",
                image: Images.bag,
              ),
              CustomButtonCard(
                onPressed: () {},
                text: "Address",
                image: Images.location,
              ),
              CustomButtonCard(
                onPressed: () {},
                text: "Payment",
                image: Images.creditCard,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
