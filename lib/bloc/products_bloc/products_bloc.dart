import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart'
    show LoadError, Product, ProductsRepo, ProductsRepoService;

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    ProductsRepo repo = ProductsRepoService();
    on<GetProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      try {
        List<Product> productsList = await repo.getProducts();
        emit(ProductsLoaded(productsList: productsList));
      } on LoadError catch (e) {
        emit(ProductsFailure(message: e.message));
      } catch (_) {
        emit(ProductsFailure(message: 'Service Unavailable'));
      }
    });
  }
}
