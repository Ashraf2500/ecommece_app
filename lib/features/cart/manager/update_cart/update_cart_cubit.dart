import 'package:dio/dio.dart';
import 'package:ecommece_app/core/utils/shared/cache_helber.dart';
import 'package:ecommece_app/features/cart/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/get_cart_model.dart';

part 'update_cart_state.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  UpdateCartCubit() : super(UpdateCartInitial());

  static UpdateCartCubit get(context) => BlocProvider.of(context);

  double subTotals = 0.0;
  double oldPrices = 0.0;
  double discounts = 0.0;
  int quantitys = 1;
  void updateDateToGetIndex(subTotal, oldPrice, discount, quantitylenght) {
    subTotals = subTotal;
    oldPrices = oldPrice;
    discounts = discount;
    quantitys = quantitylenght;
  }

  Future<void> updateCart(
      int id, context, int incrementValue, int quantity) async {
    try {
          print("1");
      String token = await CacheHelber.getData(key: "token");
      emit(UpdateCartLoading());
      Dio dio = Dio(
        BaseOptions(
          receiveDataWhenStatusError: true,
          headers: {
            "lang": "en",
            "Content-Type": "application/json",
            "Authorization": token,
          },
        ),
      );

      final response = await dio.put(
        "https://student.valuxapps.com/api/carts/$id",
        data: {"quantity": quantity + incrementValue},
      );
      final putData = GetCartModel.fromJson(response.data);
      if (putData.status) {
        GetCartCubit.get(context).getDataForCart();
      }

      emit(UpdateCartSuccess(getCartModel: putData));
    } on Exception catch (e) {
      emit(UpdateCartFailure(errMessages: e.toString()));
    }
  }
}
