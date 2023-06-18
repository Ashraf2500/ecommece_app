part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}


class SearchSuccess extends SearchState {
  final SearchModel searchModel;

  SearchSuccess({required this.searchModel});

} 

class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure({required this.errorMessage});

}
// class SearchView extends SearchState{}
