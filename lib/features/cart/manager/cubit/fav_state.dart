part of 'fav_cubit.dart';

@immutable
abstract class FavState {}

class FavInitial extends FavState {}

class FavLoading extends FavState {}
class favFailure extends FavState {
  final String errorMessage;

  favFailure({required this.errorMessage}); 
}
class favSuccess extends FavState {
  final FavModel  favModel;

  favSuccess({required this.favModel});

}



