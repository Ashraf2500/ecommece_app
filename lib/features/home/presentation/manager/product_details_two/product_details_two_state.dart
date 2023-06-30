part of 'product_details_two_cubit.dart';

@immutable
abstract class ProductDetailsTwoState {}

class ProductDetailsTwoInitial extends ProductDetailsTwoState {}
class ProductDetailsTwoLoading extends ProductDetailsTwoState {}
class ProductDetailsTwoSuccess extends ProductDetailsTwoState {
  final ProductDetailsTwoModel productDetailsTwoModel;

  ProductDetailsTwoSuccess({required this.productDetailsTwoModel});


}
class ProductDetailsTwoFailure extends ProductDetailsTwoState {
  final String errMessages ;

  ProductDetailsTwoFailure({required this.errMessages});

}
class ProductDetailsTwoHere extends ProductDetailsTwoState {}