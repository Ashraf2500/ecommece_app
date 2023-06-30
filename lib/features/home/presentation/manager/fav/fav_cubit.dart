
import 'package:ecommece_app/features/home/data/model/fav_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/home_repo_impl.dart';



part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.homeRepoImpl) : super(FavInitial());

  
    HomeRepoImpl homeRepoImpl;

static FavCubit get(context)=> BlocProvider.of(context);


  Future<void> getFavCategory() async {
  
    emit(FavLoading());
    final favData = await homeRepoImpl.getMyFavCategory();

    favData.fold((failure) {
      emit(FavFailure(errorMessage: failure.errMessages));
    }, (data) {
      emit(FavSuccess(favModel: data));
    
    });
  }
}
