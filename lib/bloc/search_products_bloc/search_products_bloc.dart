import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart'
    show LoadError, Product, ProductsRepo, ProductsRepoService;

part 'search_products_event.dart';
part 'search_products_state.dart';

class SearchProductsBloc
    extends Bloc<SearchProductsEvent, SearchProductsState> {
  SearchProductsBloc() : super(SearchProductsInitial()) {
    ProductsRepo repo = ProductsRepoService();
    on<SearchProductsByTitle>((event, emit) async {
      emit(SearchProductsLoading());
      try {
        List<Product> products = await repo.searchProductsByTitle(event.title);
        emit(SearchProductsLoaded(productsList: products));
      } on LoadError catch (e) {
        emit(SearchProductsFailure(message: e.message));
      } catch (e) {
        emit(SearchProductsFailure(message: 'Failed to search'));
      }
    });

    on<EmptySearchProducts>((event, emit) async {
      emit(SearchProductsLoaded(productsList: []));
    });
  }
}
