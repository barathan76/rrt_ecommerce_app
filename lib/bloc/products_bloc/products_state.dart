part of 'products_bloc.dart';

sealed class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  List<Product> productsList;
  ProductsLoaded({required this.productsList});
}

class ProductsFailure extends ProductsState {
  final String message;
  ProductsFailure({required this.message});
}
