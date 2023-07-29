import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:ecommece_app/core/utils/api_services/api_one_service.dart';
import 'package:ecommece_app/core/utils/api_services/api_two_service.dart';
import 'package:ecommece_app/core/utils/errors/failure.dart';
import 'package:ecommece_app/features/home/data/model/category_model.dart';
import 'package:ecommece_app/features/home/data/model/fav_model.dart';
import 'package:ecommece_app/features/home/data/model/home_model.dart';
import 'package:ecommece_app/features/home/data/model/more_category_model.dart';
import 'package:ecommece_app/features/home/data/model/product_details_two.dart';
import 'package:ecommece_app/features/home/data/model/sale_model.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo.dart';
import '../model/product_details_for_favorite.dart';

class HomeRepoImpl implements HomeRepo {
  DioHelperOne dioHelper;
  DioHelperTwo dioHelperTwo;
  HomeRepoImpl({
    required this.dioHelper,
    required this.dioHelperTwo,
  });
  @override
  Future<Either<ServerFailure, HomeModel>> bannersAndGrid() async {
    HomeModel homeModel;

    try {
      final response = await dioHelper.get(endPoint: "home");

      homeModel = HomeModel.fromJson(response);

      return right(homeModel);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<CategoryModel>>> category() async {
    Dio dio = Dio(BaseOptions(receiveDataWhenStatusError: true));
    DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
    Options myOptions =
        buildCacheOptions(const Duration(days: 7), forceRefresh: true);
    dio.interceptors.add(dioCacheManager.interceptor);
    try {
      final response = await dio.get(
          "https://mocki.io/v1/e5775744-06ba-4306-b6f6-93055de3c2d5",
          options: myOptions);

      List<dynamic> respnseData = response.data;
      List<CategoryModel> data =
          respnseData.map((e) => CategoryModel.fromJson(e)).toList();

      return right(data);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<SaleModel>>> sale() async {
    try {
      final response = await dioHelper.get(endPoint: "products");

      List<dynamic> responeData = response["data"];
      List<SaleModel> data =
          responeData.map((e) => SaleModel.fromJson(e)).toList();

      return right(data);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<ProductModel>>> moreCategory(
      category) async {
    try {
      final response =
          await dioHelperTwo.get(endPoint: "products/category/$category");

      final List<dynamic> moreCategoryDynamic = response["products"];

      final List<ProductModel> moreCategory =
          moreCategoryDynamic.map((e) => ProductModel.fromJson(e)).toList();
      return right(moreCategory);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, ProductDetailsForFavoritesModel>>
      productDetailsForFavorite(int id) async {
    try {
      final response = await dioHelper.get(endPoint: "products/$id");

      final moreCategoryModel =
          ProductDetailsForFavoritesModel.fromJson(response);

      return right(moreCategoryModel);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, FavModel>> getMyFavCategory() async {
    FavModel favModel;

    try {
      final response = await dioHelper.get(endPoint: "favorites");

      favModel = FavModel.fromJson(response);

      return right(favModel);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, ProductDetailsTwoModel>> getMyProductDetailsTwo(
      int id) async {
    try {
      ProductDetailsTwoModel productDetailsTwoModel;

      final response = await dioHelperTwo.get(endPoint: "products/$id");

      productDetailsTwoModel = ProductDetailsTwoModel.fromJson(response);
      return right(productDetailsTwoModel);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}
