part of 'category_cubit.dart';


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
