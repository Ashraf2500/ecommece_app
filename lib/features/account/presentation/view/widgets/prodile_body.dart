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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ProductAppBar(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Profile",
              ),
              const SizedBox(height: 5),
              const Divider(
                thickness: 0.4,
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                Images.mahmoud,
                                height: 50,
                              )),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            children: [
                              Text(
                                "Mahmoud Ahmed",
                                style:
                                    Style.textStyle14.copyWith(color: kTextkColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
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
                      ),
                      
                    ],
                  ),
                ),
                
              ),
              const Spacer(),
              const Text("Version 1.0.0",style: Style.textStyle16,),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
