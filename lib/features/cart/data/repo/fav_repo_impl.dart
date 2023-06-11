import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:ecommece_app/features/cart/data/model/fav_model.dart';
import 'package:ecommece_app/core/utils/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommece_app/features/cart/data/repo/fav_repo.dart';

import '../../../../core/utils/shared/cache_helber.dart';

class FavRepoImpl implements FavCategoryRepo {
  @override
  Future<Either<ServerFailure, FavModel>> getMyFavCategory() async {
    String token = await CacheHelber.getData(key: "token");

    Dio dio = Dio(BaseOptions(receiveDataWhenStatusError: true, headers: {
      "lang": "en",
      "Content-Type": "application/json",
      "Authorization": token
    }));
    FavModel favModel;

    try {
      DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      Options myOptions =
          buildCacheOptions(Duration(days: 7), forceRefresh: true);
      dio.interceptors.add(dioCacheManager.interceptor);

      final response = await dio.get(
          "https://student.valuxapps.com/api/favorites",
          options: myOptions);

      favModel = FavModel.fromJson(response.data);

      return right(favModel);
    } on DioError catch (e) {
    
      return left(ServerFailure.fromDioError(e));
    }
  }
}
