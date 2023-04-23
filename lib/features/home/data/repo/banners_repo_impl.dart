import 'package:dio/dio.dart';
import 'package:ecommece_app/features/home/data/model/banners_model.dart';
import 'package:ecommece_app/core/utils/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommece_app/features/home/data/repo/banners_repo.dart';

class BannerImpl implements BannersRepo {
  @override
  Future<Either<ServerFailure, List<Banners>>> getBanners() async {
    try {
      final response =
          await Dio().get("https://student.valuxapps.com/api/banners");

      final List<dynamic> listData = response.data["data"];

      final List<Banners> listDataModel =
          listData.map((jsonDecode) => Banners.fromJson(jsonDecode)).toList();

      return right(listDataModel);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}
