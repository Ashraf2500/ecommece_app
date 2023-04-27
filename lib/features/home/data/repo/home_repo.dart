
import 'package:dartz/dartz.dart';
import 'package:ecommece_app/core/utils/errors/failure.dart';
import 'package:ecommece_app/features/home/data/model/category_model.dart';
import 'package:ecommece_app/features/home/data/model/home_model.dart';

abstract class HomeRepo{

Future<Either<ServerFailure, HomeModel>> bannersAndGrid();


Future<Either<ServerFailure, CategoryModel>> category();

}
