import 'package:ecommece_app/core/utils/app_router.dart';
import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/shimmar/custom_cart_loading.dart';
import 'package:ecommece_app/features/cart/manager/update_cart/update_cart_cubit.dart';
import 'package:ecommece_app/features/cart/presentation/view/widgets/cart_body.dart';
import 'package:ecommece_app/features/cart/presentation/view/widgets/payment_body.dart';
import 'package:ecommece_app/features/home/presentation/view/widgets/custom_product_appbar_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Button_widget.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_text_form_faild_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomLoadingBody extends StatelessWidget {
  const CustomLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
       return Column(
                  children: [
                    ProductAppBar(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () {
                       GoRouter.of(context).pushReplacement(AppRouer.KBottomBarView);
                      },
                      text: "Your Cart",
                    ),
                    const SizedBox(height: 5),
                    const Divider(
                      thickness: 0.6,
                      color: kDescriptionText,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                       height: 300,
                      
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                      
                        itemCount:UpdateCartCubit.get(context).quantitys,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only( left: 16,right: 16,top: 16),
                            child: CustomCartLoading(),
                          );
                        },
                      ),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: CustomTextFormFaild(
                              hintText: "Enter Coupon Code",
                              obscureText: false,
                              validator: (v) {
                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            child: CustomButton(
                              onPressed: () {},
                              text: "Apply",
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 230,
                      width: 360,
                      decoration: BoxDecoration(
                        border: Border.all(color: kBorderColor),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Items ($quantity)",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$$subTotal",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "old price",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$${UpdateCartCubit.get(context).oldPrices}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Discount",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$${UpdateCartCubit.get(context).discounts}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: kBorderColor,
                            thickness: 1,
                          ),
                          Container(
                            margin: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total Price",
                                  style: TextStyle(
                                    color: kTextkColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$$total",
                                  style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CheckoutPage(
                        discount: UpdateCartCubit.get(context).discounts,
                        subtotal: subTotal,
                        total: total,
                      ),
                    ),
                    const SizedBox(height:6),
                  ],
                );
              
  }
}