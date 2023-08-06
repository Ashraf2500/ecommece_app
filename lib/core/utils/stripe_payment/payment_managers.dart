import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';

import '../app_router.dart';


abstract class PaymentManager{
 static const String publishablekey =
      "pk_test_51Nc2bbB3RPs6EFIn2fZiMoodE4fBxwkb0UyXovaa6nZTMdi4tSMIErvgrGR2RxKxtEf1vdMfwwjYXADzvWc1wXWx00ThW9TlRm";
  static const String secretkey =
      "sk_test_51Nc2bbB3RPs6EFInRheN9inDLgZ2rB8JLXdY2KsS2MeYyzS3VVdUy33MgyoaWZOFmhYRfCrlmxVDv2g3tDsjbhsJ00tsPSxE8K";

  static Future<void>makePayment(int amount,String currency,context)async{
    try {
      String clientSecret=await _getClientSecret((amount*100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
        GoRouter.of(context).push(AppRouer.KPaymentSuccess);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void>_initializePaymentSheet(String clientSecret)async{
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Basel",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount,String currency)async{
    Dio dio=Dio();
    var response= await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer $secretkey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    return response.data["client_secret"];
  }

}