import 'package:ecommece_app/core/utils/app_router.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:go_router/go_router.dart';
import 'package:snackbar/snackbar.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    super.key,
    required this.total,
    required this.subtotal,
    required this.discount,
  });
  final double total;
  final double subtotal;
  final double discount;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckout(
            sandboxMode: true,
            clientId:
                "AUb909zD4VxKka9VWvimFY2RTvC2rU9FAKe1pqnSSiFMZ657HhR26s3c1C7QhhM3pQLgGfwlyYLf3zUR",
            secretKey:
                "EMF1mXyyKwEmB4AMwQ37iilkG9HfcF6jFz-1qLYhPHxN3jaAcv5XbGfvq-yjaOi_iyw2FSR5E8z9hoBq",
            returnURL: "success.snippetcoder.com",
            cancelURL: "cancel.snippetcoder.com",
            transactions: [
              {
                "amount": {
                  "total": '${total.toDouble()}',
                  "currency": "USD",
                  "details": {
                    "subtotal": '${subtotal.toDouble()}',
                    "shipping": '0',
                    "shipping_discount": discount.toDouble()
                  }
                },
                "description": "The payment transaction description.",

                // "item_list": {
                //   "items": [
                //     {
                //       "name": "Apple",
                //       "quantity": 4,
                //       "price": '5',
                //       "currency": "USD"
                //     },
                //     {
                //       "name": "Pineapple",
                //       "quantity": 5,
                //       "price": '10',
                //       "currency": "USD"
                //     }
                //   ],
                // }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              GoRouter.of(context).pushReplacement(AppRouer.KPaymentSuccess);
            },
            onError: (error) {
              snack(error.toString());

              Navigator.pop(context);
            },
            onCancel: () {
              snack("The operation has been cancelled");
            },
          ),
        ));
      },
      text: "Check Out",
    );
  }
}
