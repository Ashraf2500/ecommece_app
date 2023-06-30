
part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final HomeModel? homeModel;

  HomeSuccess({
    this.homeModel,
  });
}


class HomeFailure extends HomeState {

 final String errorMessage ;
HomeFailure({
    required this.errorMessage,
  });

  
}


