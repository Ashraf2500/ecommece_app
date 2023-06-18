part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final ProductDetailsForFavoritesModel productDetailsForFavoritesModel;

  ProductDetailsSuccess({required this.productDetailsForFavoritesModel});


}

class ProductDetailsFailure extends ProductDetailsState {
  final String errMessages;

  ProductDetailsFailure({required this.errMessages});

}