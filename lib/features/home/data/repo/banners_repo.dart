
import 'package:dartz/dartz.dart';
import 'package:ecommece_app/core/utils/errors/failure.dart';
import 'package:ecommece_app/features/home/data/model/banners_model.dart';

abstract class BannersRepo{

Future< Either<ServerFailure,List<Banners>>> getBanners();


}