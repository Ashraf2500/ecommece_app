import 'package:dio/dio.dart';
import 'package:ecommece_app/core/utils/api/api_service.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(dioHelper: DioHelper(Dio())),
  );
}
