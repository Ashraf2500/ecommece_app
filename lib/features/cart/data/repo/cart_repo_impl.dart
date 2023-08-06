import 'package:dio/dio.dart';
import 'package:ecommece_app/features/cart/data/model/get_cart_model.dart';
import 'package:ecommece_app/core/utils/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommece_app/features/cart/data/repo/cart_repo.dart';

import '../../../../core/utils/shared/cache_helber.dart';

class CartRepoImpl implements CartRepo {
  @override
  Future<Either<ServerFailure, GetCartModel>> getcartData() async {
    try {
      String token = await CacheHelber.getData(key: "token");

      Dio dio = Dio(BaseOptions(receiveDataWhenStatusError: true, headers: {
        "lang": "en",
        "Content-Type": "application/json",
        "Authorization": token
      }));
  
      final response = await dio.get("https://student.valuxapps.com/api/carts",
        );
      final data = GetCartModel.fromJson(response.data);
      return right(data);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }


}
