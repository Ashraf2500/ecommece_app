import 'package:dio/dio.dart';


class DioHelperThere {
   final _baseUrl = "https://fakestoreapi.com/";

  Dio _dio;

  DioHelperThere(this._dio);

 Future<List<dynamic>>  get({required String endPoint}) async {
    

    _dio = Dio(BaseOptions(receiveDataWhenStatusError: true,));


   
    var respone = await _dio.get("$_baseUrl$endPoint",);
  
    return respone.data;
  }
}






