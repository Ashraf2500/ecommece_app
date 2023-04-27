import 'package:dio/dio.dart';
import 'package:ecommece_app/core/utils/shared/cache_helber.dart';
import 'package:ecommece_app/features/home/data/model/category_model.dart';
import 'package:ecommece_app/features/home/data/model/home_model.dart';
import 'package:ecommece_app/core/utils/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo.dart';


class HomeRepoImpl implements HomeRepo {
  @override
  
  Future<Either<ServerFailure, HomeModel>> bannersAndGrid() async {
    HomeModel homeModel;
    String token = await CacheHelber.getData(key: "token");
    try {
      final response = await Dio(BaseOptions(
          receiveDataWhenStatusError: true,
          headers: {
            "lang": "en",
            "Content-Type": "application/json",
            "Authorization": token
          })).get("https://student.valuxapps.com/api/home");

      homeModel = HomeModel.fromJson(response.data);

      return right(homeModel);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, CategoryModel>> category() async {
    CategoryModel categoryModel;
    try {
      final response = await Dio(BaseOptions(headers: {"lang": "en"}))
          .get("https://student.valuxapps.com/api/categories");

      categoryModel = CategoryModel.fromJson(response.data);

      return right(categoryModel);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}
