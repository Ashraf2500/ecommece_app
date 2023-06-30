import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/features/cart/presentation/view/widgets/custom_one_product_cart.dart';
import 'package:ecommece_app/features/cart/presentation/view/widgets/payment_body.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_text_form_faild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentation/view/widgets/custom_product_appbar_widget.dart';
import '../../../../regis/presentation/views/widgets/custom_Button_widget.dart';

import '../../../manager/get_cart_cubit/get_cart_cubit.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  double discount = 0;
  double total = 0;
  int quantity = 0;
  double oldPrice = 0;
  double subTotal = 0;

  @override
  void initState() {
    super.initState();
    context.read<GetCartCubit>().getDataForCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return BlocConsumer<GetCartCubit, GetCartState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is CartCubitFailureforGetData) {
                  return Center(
                    child: Text(state.errMessages),
                  );
                }
                if (state is CartCubitSuccessforGetData) {
                  quantity = state.getCartModel.data.cartItems.length;
                  subTotal = state.getCartModel.data.subTotal.toDouble();
                  total = state.getCartModel.data.total.toDouble();

                  return Column(
                    children: [
                      ProductAppBar(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "Your Cart",
                      ),

                      const SizedBox(height: 5),
                      const Divider(
                        thickness: 0.6,
                        color: kDescriptionText,
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: quantity,
                          itemBuilder: (context, index) {
                            var cartItem =
                                state.getCartModel.data.cartItems[index];
                            var product = cartItem.product;
                            var quantity = cartItem.quantity;
                            var price = product.price;
                            var name = product.name;
                            var image = product.image;
                            var total = state.getCartModel.data.total;
                            var subTotal = state.getCartModel.data.subTotal;
                            var discount = product.discount;
                            var oldPrice = product.oldPrice;
                            var dataId = cartItem.product.id;
                            print(dataId);
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: CustomOneProductCart(
                                id: dataId,
                                discount: discount,
                                image: image,
                                name: name,
                                price: price,
                                quantity: quantity,
                                total: total,
                                subTotal: subTotal,
                                oldPrice: oldPrice,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 32),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    "$subTotal",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    "$oldPrice",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    "$discount",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    "$total",
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
                          discount: discount,
                          subtotal: subTotal,
                          total: total,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
