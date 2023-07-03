import 'package:ecommece_app/features/cart/presentation/view/widgets/cart_body.dart';

import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key,  this.chech}) : super(key: key);
  final bool? chech;
  @override
  Widget build(BuildContext context) {
    return  CartBody(
      chech: chech!,
    );
  }
}
