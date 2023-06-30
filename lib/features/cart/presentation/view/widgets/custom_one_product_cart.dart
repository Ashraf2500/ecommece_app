import 'package:ecommece_app/core/utils/constans.dart';
import 'package:ecommece_app/core/utils/assets.dart';
import 'package:ecommece_app/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomOneProductCart extends StatelessWidget {
   const CustomOneProductCart({
    super.key,
    required this.discount,
    required this.total,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.subTotal,
    required this.oldPrice, required this.id,
  });
 

  final double discount;
  final int total;
  final String image;
  final String name;
  final double price;
  final int quantity;
  final int subTotal;
  final double oldPrice;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 343,
      decoration: BoxDecoration(
        border: Border.all(color: kBorderColor),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Row(children: [
        const SizedBox(
          width: 16,
        ),
        Image.network(
          image,
          width: 72,
          height: 72,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 7,
        ),
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
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
               
                  IconButton(
                      onPressed: () {
                        print("my id is $id");
                        context.read<CartCubit>().postCart(id,context);
                      }, icon: Image.asset(Images.rubbish)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ $price",
                    style: const TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                  Container(
                    width: 104,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 215, 221, 237)),
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 31,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          color: kBorderColor,
                          child: const Center(
                            child: Text(
                              "1",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 31,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
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
      ]),
    );
  }
}
