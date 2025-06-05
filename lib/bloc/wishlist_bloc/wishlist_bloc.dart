import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    WishlistProductsRepo wishlistProductsRepo = WishlistProductsRepoService();
    on<CheckWishListed>((event, emit) async {
      emit(WishlistLoading());
      try {
        bool condition = await wishlistProductsRepo.isWishlisted(
          event.productId,
        );
        if (condition) {
          emit(ProductWishlisted());
        } else {
          emit(ProductNotWishlisted());
        }
      } catch (_) {
        emit(ProductNotWishlisted());
      }
    });
  }
}
