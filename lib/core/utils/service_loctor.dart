import 'package:dio/dio.dart';
import 'package:ecommece_app/core/utils/api/api_one_service.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl(dioHelper: getIt<DioHelperOne>()));

  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<DioHelperOne>(() => DioHelperOne(getIt()));
}
