import 'package:dartz/dartz.dart';
import 'package:ecommece_app/core/utils/errors/failure.dart';
import 'package:ecommece_app/features/home/data/model/category_model.dart';
import 'package:ecommece_app/features/home/data/model/home_model.dart';
import 'package:ecommece_app/features/home/data/model/more_category_model.dart';
import 'package:ecommece_app/features/home/data/model/product_details_two.dart';
import 'package:ecommece_app/features/home/data/model/sale_model.dart';

import '../model/fav_model.dart';
import '../model/product_details_for_favorite.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, HomeModel>> bannersAndGrid();

  Future<Either<ServerFailure, List<CategoryModel>>> category();

  Future<Either<ServerFailure, List<SaleModel>>> sale();

  Future<Either<ServerFailure, List<ProductModel>>> moreCategory(
      String category);
  Future<Either<ServerFailure, ProductDetailsForFavoritesModel>>
      productDetailsForFavorite(int id);
  Future<Either<ServerFailure, FavModel>> getMyFavCategory();

  Future<Either<ServerFailure, ProductDetailsTwoModel>> getMyProductDetailsTwo(int id);
}
