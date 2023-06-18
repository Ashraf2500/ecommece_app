part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categoryModel;

  CategorySuccess({required this.categoryModel});
}

class CategoryFailure extends CategoryState {
  final String errorMessage;
  CategoryFailure({
    required this.errorMessage,
  });
}
class CategoryListDetailsLoading extends CategoryState {}
class CategoryListDetailsSuccess extends CategoryState {
  final ListOfCategoryModel listOfCategoryModel;
  CategoryListDetailsSuccess({required this.listOfCategoryModel});
}
class CategoryListDetailsFailure extends CategoryState {
  final String errorMessage;

  CategoryListDetailsFailure({required this.errorMessage});

}