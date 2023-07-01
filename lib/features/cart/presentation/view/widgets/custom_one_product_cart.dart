// ignore_for_file: must_be_immutable

import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommece_app/features/cart/manager/update_cart/update_cart_cubit.dart';
import 'package:ecommece_app/features/home/presentation/manager/banners_and_grid_view/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomOneProductCart extends StatefulWidget {
  const CustomOneProductCart({
    Key? key,
    required this.total,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.idproduct,
    required this.idCart,
    required this.subTotal,
    required this.oldPrice,
    required this.discount,
    required this.quantitylenght,
    required this.inFavorites,
    
  }) : super(key: key);

  final int total;
  final String image;
  final String name;
  final double price;
  final int quantity;
  final double subTotal;
  final double oldPrice;
  final double discount;
final int quantitylenght;
  final int idproduct;
  final int idCart;
  final bool inFavorites;
  

  @override
  State<CustomOneProductCart> createState() => _CustomOneProductCartState();
}

class _CustomOneProductCartState extends State<CustomOneProductCart> {
  @override
  void initState() {
    super.initState();
    context.read<UpdateCartCubit>().updateDateToGetIndex(
        widget.subTotal, widget.oldPrice, widget.discount,widget.quantitylenght);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 343,
      decoration: BoxDecoration(
        border: Border.all(color: kBorderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Image.network(
            widget.image,
            width: 70,
            height: 85,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 7),
          SizedBox(
            width: 262,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 166,
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ), 
                    IconButton(
                      onPressed: () {
                        
                       context.read<HomeCubit>().sendFavorite(widget.idproduct,context);
                      },
                      icon:  Icon(Icons.favorite_rounded, size: 25,
                    
                      color: widget.inFavorites ? kRedColor : kDescriptionText
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context
                            .read<CartCubit>()
                            .postCart(widget.idproduct, context);
                      },
                      icon: Image.asset(Images.rubbish),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${widget.price}",
                      style: const TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                    Container(
                      width: 104,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 215, 221, 237),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 31,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (widget.quantity > 1) {
                                  context.read<UpdateCartCubit>().updateCart(
                                      widget.idCart,
                                      context,
                                      -1,
                                      widget.quantity);
                                }
                              },
                              icon: const Icon(
                                Icons.remove,
                              ),
                            ),
                          ),
                          Container(
                            width: 40,
                            color: kBorderColor,
                            child: Center(child: Text("${widget.quantity}")),
                          ),
                          SizedBox(
                            width: 31,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                context.read<UpdateCartCubit>().updateCart(
                                    widget.idCart, context, 1, widget.quantity);
                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

