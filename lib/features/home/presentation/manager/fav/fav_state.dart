part of 'fav_cubit.dart';

@immutable
abstract class FavState {}

class FavInitial extends FavState {}

class FavLoading extends FavState {}
class FavFailure extends FavState {
  final String errorMessage;

  FavFailure({required this.errorMessage}); 
}
class FavSuccess extends FavState {
  final FavModel  favModel;

  FavSuccess({required this.favModel});

}



