import 'package:ecommece_app/features/home/data/model/more_category_model.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'more_category_state.dart';

class MoreCategoryCubit extends Cubit<MoreCategoryState> {
  MoreCategoryCubit(this.homeRepoImpl) : super(MoreCategoryInitial());

  HomeRepoImpl homeRepoImpl;
static MoreCategoryCubit get(context)=> BlocProvider.of(context);
  getData({category}) async {
    emit(MoreCategoryLoading());

    final data = await homeRepoImpl.moreCategory(category);

    data.fold((errorMessage) {

      emit(MoreCategoryFailure(errorMessage: errorMessage.errMessages));
    }, (data) {

      emit(MoreCategorySuccess(moreCategoryModel: data));
    });
  }
}
