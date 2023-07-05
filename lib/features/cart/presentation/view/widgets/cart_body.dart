import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/style.dart';
import 'package:ecommece_app/features/cart/manager/update_cart/update_cart_cubit.dart';
import 'package:ecommece_app/features/cart/presentation/view/widgets/custom_loading_cart_body.dart';
import 'package:ecommece_app/features/cart/presentation/view/widgets/custom_one_product_cart.dart';
import 'package:ecommece_app/features/cart/presentation/view/widgets/payment_body.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_text_form_faild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../home/presentation/view/widgets/custom_product_appbar_widget.dart';
import '../../../../regis/presentation/views/widgets/custom_Button_widget.dart';

import '../../../manager/get_cart_cubit/get_cart_cubit.dart';

var quantity = 0;
var subTotal = 0.0;
var total = 0.0;

class CartBody extends StatefulWidget {
  const CartBody({super.key, required this.chech});
  final bool chech;
  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  void initState() {
    super.initState();
    context.read<GetCartCubit>().getDataForCart();
    print(widget.chech);
    // تهيئة الحقل بقيمة افتراضية
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
                  var quantity = state.getCartModel.data.cartItems.length;
                  var subTotal = state.getCartModel.data.subTotal.toDouble();
                  var total = state.getCartModel.data.total.toDouble();

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        widget.chech
                            ? ProductAppBar(
                                icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                text: "Your Cart",
                              )
                            : const ProductAppBar(
                                text: "Your Cart",
                              ),
                        const SizedBox(height: 5),
                        const Divider(
                          thickness: 0.4,
                        ),
                        const SizedBox(height: 10),
                        quantity == 0
                            ? Center(
                                child: Column(
                                children: [
                                  Lottie.asset("assets/animations/cart.json"),
                                  const Text(
                                    "Your cart is empty",
                                    style: Style.textStyle20,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  )
                                ],
                              ))
                            : SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: quantity,
                                  itemBuilder: (context, index) {
                                    var cartItem = state
                                        .getCartModel.data.cartItems[index];
                                    var product = cartItem.product;
                                    var quantitys = cartItem.quantity;
                                    var price = product.price;
                                    var name = product.name;
                                    var image = product.image;
                                    var total = state.getCartModel.data.total;
                                    var inFavorites =
                                        cartItem.product.inFavorites;
                                    var discount = product.discount;
                                    var oldPrice = product.oldPrice;
                                    var dataId = cartItem.product.id;
                                    var cartId = cartItem.id;

                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16, top: 16),
                                      child: CustomOneProductCart(
                                        inFavorites: inFavorites,
                                        quantitylenght: quantity,
                                        idCart: cartId,
                                        idproduct: dataId,
                                        discount: discount,
                                        oldPrice: oldPrice,
                                        subTotal: subTotal,
                                        image: image,
                                        name: name,
                                        price: price,
                                        quantity: quantitys,
                                        total: total,
                                      ),
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
                              const SizedBox(height: 5),
                              const Divider(
                                thickness: 0.4,
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
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                }
                return const CustomLoadingBody();
              },
            );
          },
        ),
      ),
    );
  }
}
