import 'package:dartz/dartz.dart';
import 'package:ecommece_app/core/utils/errors/failure.dart';
import 'package:ecommece_app/features/cart/data/model/get_cart_model.dart';


abstract class CartRepo {
  Future<Either<ServerFailure, GetCartModel>> getcartData();
}
