part of 'sale_cubit.dart';

@immutable
abstract class SaleState {}

class SaleInitial extends SaleState {}

class SaleLoading extends SaleState {}

class SaleSuccess extends SaleState {
  final List<SaleModel> saleModel;
  SaleSuccess({required this.saleModel});
}

class SaleFailure extends SaleState {
 
 final String errorMessage;
SaleFailure({required this.errorMessage});

}
