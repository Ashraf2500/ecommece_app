import 'package:dio/dio.dart';
import 'package:ecommece_app/core/utils/api_services/api_one_service.dart';
import 'package:ecommece_app/core/utils/api_services/api_there_service.dart';
import 'package:ecommece_app/core/utils/api_services/api_two_service.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl(
      dioHelper: getIt<DioHelperOne>(), dioHelperTwo: getIt<DioHelperTwo>(),dioHelperThere: getIt<DioHelperThere>()));

  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<DioHelperOne>(() => DioHelperOne(getIt()));
  getIt.registerLazySingleton<DioHelperTwo>(() => DioHelperTwo(getIt()));
  getIt.registerLazySingleton<DioHelperThere>(() => DioHelperThere(getIt()));
}
