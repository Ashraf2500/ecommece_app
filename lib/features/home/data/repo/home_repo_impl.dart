// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'package:ecommece_app/core/utils/api/api_service.dart';
import 'package:ecommece_app/core/utils/errors/failure.dart';
import 'package:ecommece_app/core/utils/shared/cache_helber.dart';
import 'package:ecommece_app/features/home/data/model/category_model.dart';
import 'package:ecommece_app/features/home/data/model/fav_model.dart';
import 'package:ecommece_app/features/home/data/model/home_model.dart';
import 'package:ecommece_app/features/home/data/model/more_category_model.dart';
import 'package:ecommece_app/features/home/data/model/product_details_two.dart';
import 'package:ecommece_app/features/home/data/model/sale_model.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo.dart';

import '../model/product_details_for_favorite.dart';

class HomeRepoImpl implements HomeRepo {
  DioHelper dioHelper;
  HomeRepoImpl({
    required this.dioHelper,
  });
  @override
  Future<Either<ServerFailure, HomeModel>> bannersAndGrid() async {
   String token = await CacheHelber.getData(key: "token");

    Dio dio = Dio(BaseOptions(receiveDataWhenStatusError: true, headers: {
      "lang": "en",
      "Content-Type": "application/json",
      "Authorization": token
    }));
    HomeModel homeModel;

    try {
      DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      Options myOptions =
          buildCacheOptions(const Duration(days: 7), forceRefresh: true);
      dio.interceptors.add(dioCacheManager.interceptor);

      final response = await dio.get("https://student.valuxapps.com/api/home",
          options: myOptions);

      homeModel = HomeModel.fromJson(response.data);

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
    Dio dio = Dio(BaseOptions(receiveDataWhenStatusError: true));
    DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
    Options myOptions =
        buildCacheOptions(const Duration(days: 7), forceRefresh: true);
    dio.interceptors.add(dioCacheManager.interceptor);
    try {
      final respone = await dio.get("https://fakestoreapi.com/products",
          options: myOptions);

      List<dynamic> responeData = respone.data;
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
    Dio dio = Dio(BaseOptions(receiveDataWhenStatusError: true));
    DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
    Options myOptions =
        buildCacheOptions(const Duration(days: 7), forceRefresh: true);
    dio.interceptors.add(dioCacheManager.interceptor);
    try {
      final response = await dio.get(
          "https://dummyjson.com/products/category/$category",
          options: myOptions);

      final moreCategoryModel = MoreCategoryModel.fromJson(response.data);

      return right(moreCategoryModel.products);
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
          ProductDetailsForFavoritesModel.fromJson(response.data);

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

      favModel = FavModel.fromJson(response.data);

      return right(favModel);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, ProductDetailsTwoModel>> getMyProductDetailsTwo(
      int id) async {
    ProductDetailsTwoModel productDetailsTwoModel;

    Dio dio = Dio(BaseOptions(receiveDataWhenStatusError: true));

    DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());

    Options myOptions =
        buildCacheOptions(const Duration(days: 7), forceRefresh: true);
    dio.interceptors.add(dioCacheManager.interceptor);

    try {
      final response = await dio.get("https://dummyjson.com/products/$id",
          options: myOptions);

      productDetailsTwoModel = ProductDetailsTwoModel.fromJson(response.data);

      return right(productDetailsTwoModel);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}
