import 'package:dio/dio.dart';
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


   
    var respone = await _dio.get("$_baseUrl$endPoint",);
    return respone.data;
  }
}






