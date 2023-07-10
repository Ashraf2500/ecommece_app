part of 'update_cart_cubit.dart';


abstract class UpdateCartState {}

class UpdateCartInitial extends UpdateCartState {}
class UpdateCartLoading extends UpdateCartState {}
class UpdateCartSuccess extends UpdateCartState {
  final GetCartModel getCartModel;

  UpdateCartSuccess({required this.getCartModel});

}
class UpdateCartFailure extends UpdateCartState {
  final String errMessages;

  UpdateCartFailure({required this.errMessages});


}


class UpdateCart extends UpdateCartState {
  final int dataIncrementOrDecrement;

  UpdateCart({required this.dataIncrementOrDecrement});
}
class UpdateCartdone extends UpdateCartState {}