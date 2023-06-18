import 'package:ecommece_app/features/home/data/model/category_model.dart';
import 'package:ecommece_app/features/home/data/model/list_of_category_model.dart';
import 'package:ecommece_app/features/home/data/repo/home_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeRepoImpl) : super(CategoryInitial());

  HomeRepoImpl homeRepoImpl;

  static CategoryCubit get(context) => BlocProvider.of(context);

  Future<void> getCategory() async {
    emit(CategoryLoading());
    final categoryData = await homeRepoImpl.category();

    categoryData.fold((failure) {
      emit(CategoryFailure(errorMessage: failure.errMessages));
    }, (data) {
      emit(CategorySuccess(categoryModel: data));
    });
  }

  Future<void> getCategoryDetails(int id) async {
    emit(CategoryListDetailsLoading());
    final categoryData = await homeRepoImpl.getListOfCategory(id);

    categoryData.fold((failure) {
      emit(CategoryListDetailsFailure(errorMessage: failure.errMessages));
    }, (data) {
      emit(CategoryListDetailsSuccess(listOfCategoryModel: data));
    });
  }
}
