part of 'search_products_bloc.dart';

sealed class SearchProductsEvent {}

class SearchProductsByTitle extends SearchProductsEvent {
  final String title;
  SearchProductsByTitle(this.title);
}

class EmptySearchProducts extends SearchProductsEvent {}
