import 'package:dio/dio.dart';
import 'package:ecommece_app/features/cart/manager/cubit/fav_cubit.dart';
import 'package:ecommece_app/features/home/data/model/home_model.dart';
import 'package:ecommece_app/features/home/data/model/select_favorit_model.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/utils/shared/cache_helber.dart';
part 'home_state.dart';



class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImpl homeRepoImpl;
  int activeIndex = 0;

  HomeCubit(this.homeRepoImpl) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  Map<int, bool> favorite = {};

  void getHomeData() async {
  final result = await homeRepoImpl.bannersAndGrid();

  result.fold(
    (error) => emit(HomeFailure(errorMessage: error.errMessages)),
    (data) {
      data.data.products.forEach(
        (element) {
          favorite.addAll({element.id: element.inFavorites});
        },
      );

      emit(HomeSuccess(homeModel: data));
    },
  );
}

  void sendFavorite(int product_id,context) async {
  
  favorite[product_id] = !favorite[product_id]!;

      HomeModel? homeModel = (state as HomeSuccess).homeModel;

      emit(HomeSuccess(homeModel: homeModel));

      SelectFavoritModel selectFavoritModel;

      String token = await CacheHelber.getData(key: "token");

      final response = await Dio(BaseOptions(headers: {
        "lang": "en",
        "Content-Type": "application/json",
        "Authorization": token
      })).post("https://student.valuxapps.com/api/favorites",
          data: {"product_id": product_id}).then((value) {
        selectFavoritModel = SelectFavoritModel.fromJson(value.data);

        if (!selectFavoritModel.status) {
          favorite[product_id] = !favorite[product_id]!;
        }else{
          FavCubit.get(context).getFavCategory();
        }
        emit(HomeSuccess(homeModel: homeModel));
        
      }).catchError((error) {
        favorite[product_id] = !favorite[product_id]!;

        emit(HomeSuccess(homeModel: homeModel));
      });
    } 
  }

