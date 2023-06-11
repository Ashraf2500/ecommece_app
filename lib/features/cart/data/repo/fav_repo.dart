import 'package:dartz/dartz.dart';
import 'package:ecommece_app/features/cart/data/model/fav_model.dart';

import '../../../../core/utils/errors/failure.dart';


abstract class FavCategoryRepo{

  Future<Either<ServerFailure, FavModel>> getMyFavCategory();
}