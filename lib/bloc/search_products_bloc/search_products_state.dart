part of 'search_products_bloc.dart';

sealed class SearchProductsState {}

class SearchProductsInitial extends SearchProductsState {}

class SearchProductsLoading extends SearchProductsState {}

class SearchProductsLoaded extends SearchProductsState {
  List<Product> productsList;
  SearchProductsLoaded({required this.productsList});
}

class SearchProductsFailure extends SearchProductsState {
  final String message;
  SearchProductsFailure({required this.message});
}
