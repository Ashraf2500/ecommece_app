import 'package:ecommece_app/core/utils/stripe_payment/payment_managers.dart';
import 'package:ecommece_app/features/regis/presentation/views/widgets/custom_Button_widget.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    super.key,
    required this.total,
  });
  final double total;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        PaymentManager.makePayment(total.toInt(), "USD",context);
      
      },
      text: "Check Out",
    );
  }
}
