import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/account/presentation/view/widgets/custom_card_bottom.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_product_appbar_widget.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProductAppBar(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
              text: "Profile",
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: kBorderColor,
              thickness: 2,
              height: 2,
            ),
             const SizedBox(
                height: 24,
              ),
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                        Row(
            children: [
              CircleAvatar(
                radius: 24,
                child: Image.asset(Images.profile),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  Text(
                    "James Lawson",
                    style: Style.textStyle14.copyWith(color: kTextkColor),
                  ),
              
                ],
              ),
            ],
          ),
          const SizedBox(height: 32,),
                      CustomButtonCard(
              onPressed: () {},
              text: "Gender",
              image: Images.gender,
              textTwo: "Male",
            ),
            CustomButtonCard(
              onPressed: () {},
              text: "Birthday",
              image: Images.date,
              textTwo: "12-1-2001",
            ),
            CustomButtonCard(
              onPressed: () {},
              text: "Email",
              image: Images.message,
              textTwo: "m7moud@gmail.com.com",
            ),
            CustomButtonCard(
              onPressed: () {},
              text: "Phone Number",
              image: Images.phone,
              textTwo: "01068365035",
            ),
            CustomButtonCard(
              onPressed: () {},
              text: "Change Password",
              image: Images.password,
              textTwo: "******",
            )
          
                  ],
                ),
              )
        
          ],
        ),
      ),
    );
  }
}
