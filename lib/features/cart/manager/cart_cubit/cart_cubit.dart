import 'package:dio/dio.dart';
import 'package:ecommece_app/core/utils/errors/failure.dart';
import 'package:ecommece_app/core/utils/shared/cache_helber.dart';
import 'package:ecommece_app/features/cart/data/model/post_cart_model.dart';
import 'package:ecommece_app/features/cart/manager/cart_cubit/cart_state.dart';
import 'package:ecommece_app/features/cart/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartCubitInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  Future<void> postCart(int id, context) async {

    String token = await CacheHelber.getData(key: "token");
    Dio dio = Dio(BaseOptions(receiveDataWhenStatusError: true, headers: {
      "lang": "en",
      "Content-Type": "application/json",
      "Authorization": token
    }));
    emit(CartCubitLoading());
    try {
    
      final response = await dio.post("https://student.valuxapps.com/api/carts",
         data: {"product_id": id});
         
   
      final data = PostCartModel.fromJson(response.data);
      emit(CartCubitSuccess());
      if (data.message == "Deleted Successfully") {
        
        GetCartCubit.get(context).getDataForCart();
      }else{
        GetCartCubit.get(context).getDataForCart();
      }
      emit(CartCubitSuccess());
    } on DioException catch (e) {
     
      ServerFailure.fromDioError(e);
    }
  }
}
