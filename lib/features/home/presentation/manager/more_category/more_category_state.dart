
part of 'more_category_cubit.dart';

@immutable
abstract class MoreCategoryState {}

class MoreCategoryInitial extends MoreCategoryState {}
class MoreCategoryLoading extends MoreCategoryState {}
class MoreCategorySuccess extends MoreCategoryState {

  final List<ProductModel> moreCategoryModel;

  MoreCategorySuccess( {required this.moreCategoryModel});

}
class MoreCategoryFailure extends MoreCategoryState {
  final String errorMessage;
  MoreCategoryFailure({
    required this.errorMessage,
  });
}
