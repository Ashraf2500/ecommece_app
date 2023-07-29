import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:ecommece_app/core/utils/shared/cache_helber.dart';

class DioHelperTwo {
   final _baseUrl = "https://dummyjson.com/";

  Dio _dio;

  DioHelperTwo(this._dio);

 Future<Map<String, dynamic>>  get({required String endPoint}) async {
    String token = await CacheHelber.getData(key: "token");

    _dio = Dio(BaseOptions(receiveDataWhenStatusError: true, headers: {
      "lang": "en",
      "Content-Type": "application/json",
      "Authorization": token
    }));

    // this code For Cache Data for 7 Days
    DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
    Options myOptions =
        buildCacheOptions(const Duration(days: 7), forceRefresh: true);
    _dio.interceptors.add(dioCacheManager.interceptor);
   
    var respone = await _dio.get("$_baseUrl$endPoint", options: myOptions);
    return respone.data;
  }
}





