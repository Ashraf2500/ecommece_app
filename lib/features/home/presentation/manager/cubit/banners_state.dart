part of 'banners_cubit.dart';

@immutable
abstract class BannersState {}

class BannersInitial extends BannersState {}
class BannersLoading extends BannersState {}
class BannersSuccess extends BannersState {
  final List<Banners> banners;

  BannersSuccess({required this.banners});
}
class BannersFailure extends BannersState {
  final String errorMessage;

  BannersFailure({required this.errorMessage});
}
