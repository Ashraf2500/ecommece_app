part of 'get_cart_cubit.dart';

@immutable
abstract class GetCartState {}

class GetCartInitial extends GetCartState {}

class CartCubitLoadingforGetData extends GetCartState {}
class CartCubitFailureforGetData extends GetCartState {
  final String errMessages;
  CartCubitFailureforGetData({required this.errMessages});
}
class CartCubitSuccessforGetData extends GetCartState {
   final GetCartModel getCartModel;

  CartCubitSuccessforGetData({required this.getCartModel});
}