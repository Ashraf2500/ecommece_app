import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:ecommece_app/core/utils/shared/cache_helber.dart';

class DioHelperOne {
   final _baseUrl = "https://student.valuxapps.com/api/";

  Dio _dio;

  DioHelperOne(this._dio);

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






// class ApiService {
//   final Dio _dio;
//   static const String domain = "https://student.valuxapps.com/api/";
  
//   ApiService(
//     this._dio,
//   );

//   Future<Map<String, dynamic>> get({required String endpoint}) async {
//     final response = await _dio.get("$domain$endpoint");
//     return response.data;
//   }

//   Future<Map<String, dynamic>> post(String endpoint) async {
//     final response = await _dio.post(domain);

//     return response.data;
//   }

//   Future<Map<String, dynamic>> put(String endpoint) async {
//     final response = await _dio.put(domain);

//     return response.data;
//   }
// }
