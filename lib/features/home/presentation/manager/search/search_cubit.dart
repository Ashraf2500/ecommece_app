import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:ecommece_app/core/utils/shared/cache_helber.dart';
import 'package:ecommece_app/features/home/data/model/search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  void searchProduct(String search) async {
    String token = await CacheHelber.getData(key: "token");
    Dio dio = Dio(BaseOptions(receiveDataWhenStatusError: true, headers: {
      "lang": "en",
      "Content-Type": "application/json",
      "Authorization": token
    }));
    try {
        DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      Options myOptions =
          buildCacheOptions(Duration(days: 7), forceRefresh: true);
      dio.interceptors.add(dioCacheManager.interceptor);

      emit(SearchLoading());
      final response = await dio.post("https://student.valuxapps.com/api/products/search",
      options: myOptions,
          data: {"text": search});

      final searchModel = SearchModel.fromJson(response.data);

      emit(SearchSuccess(searchModel: searchModel));
    } on DioError catch (e) {
 
      emit(SearchFailure(errorMessage: e.response.toString()));
    }
  }
}
