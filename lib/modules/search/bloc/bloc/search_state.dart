part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Result> searchResult;

  SearchLoaded({required this.searchResult});
}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}
