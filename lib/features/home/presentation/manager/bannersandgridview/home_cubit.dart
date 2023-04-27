import 'package:ecommece_app/features/home/data/model/home_model.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImpl homeRepoImpl;
 final HomeModel? homeModel = HomeModel(status: true, data: Data(banners: [], products: []));

  HomeCubit(this.homeRepoImpl,) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getHomeData() async {



    emit(HomeLoading());
    final result = await homeRepoImpl.bannersAndGrid();

    
    result.fold(
      (error) => emit(HomeFailure(errorMessage: error.errMessages)),
      (data) => emit(HomeSuccess(homeModel: data)),
    );

   
  }
}
