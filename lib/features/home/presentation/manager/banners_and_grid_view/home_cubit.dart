import 'package:dio/dio.dart';
import 'package:ecommece_app/features/cart/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:ecommece_app/features/home/data/model/home_model.dart';
import 'package:ecommece_app/features/home/data/model/select_favorit_model.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo_impl.dart';
import 'package:ecommece_app/features/home/presentation/manager/product_details/product_details_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/utils/shared/cache_helber.dart';
import '../fav/fav_cubit.dart';
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
      for (var element in data.data.products) {
          favorite.addAll({element.id: element.inFavorites});
        }

      emit(HomeSuccess(homeModel: data));
      
    },
  );
}

  void sendFavorite(int productId,context) async {
  
  favorite[productId] = !favorite[productId]!;

      HomeModel? homeModel = (state as HomeSuccess).homeModel;

      emit(HomeSuccess(homeModel: homeModel));

      SelectFavoritModel selectFavoritModel;

      String token = await CacheHelber.getData(key: "token");

      // ignore: unused_local_variable
      final response = await Dio(BaseOptions(headers: {
        "lang": "en",
        "Content-Type": "application/json",
        "Authorization": token
      })).post("https://student.valuxapps.com/api/favorites",
          data: {"product_id": productId}).then((value) {
        selectFavoritModel = SelectFavoritModel.fromJson(value.data);

        if (!selectFavoritModel.status) {
          favorite[productId] = !favorite[productId]!;
        }else{
          FavCubit.get(context).getFavCategory();
           
          GetCartCubit.get(context).getDataForCart();
          ProductDetailsCubit.get(context).getproductDetailsForFav();
        }
        emit(HomeSuccess(homeModel: homeModel));
        
      }).catchError((error) {
       
        favorite[productId] = !favorite[productId]!;

        emit(HomeSuccess(homeModel: homeModel));
      });
    } 
  }

