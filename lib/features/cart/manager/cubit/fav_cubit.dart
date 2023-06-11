
import 'package:ecommece_app/features/cart/data/model/fav_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repo/fav_repo_impl.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.favRepoImpl) : super(FavInitial());

  
    FavRepoImpl favRepoImpl;

static FavCubit get(context)=> BlocProvider.of(context);


  Future<void> getFavCategory() async {
  
    emit(FavLoading());
    final favData = await favRepoImpl.getMyFavCategory();

    favData.fold((failure) {
      emit(favFailure(errorMessage: failure.errMessages));
    }, (data) {
      emit(favSuccess(favModel: data));
    
    });
  }
}
