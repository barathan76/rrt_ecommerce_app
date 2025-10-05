import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart';
part 'wishlist_products_event.dart';
part 'wishlist_products_state.dart';

class WishlistProductsBloc
    extends Bloc<WishlistProductsEvent, WishlistProductsState> {
  WishlistProductsBloc() : super(WishlistProductsInitial()) {
    WishlistProductsRepo wishlistProductsRepo = WishlistProductsRepoService();
    on<LoadWishlistProducts>((event, emit) async {
      emit(WishlistProductsLoading());
      try {
        List<Product> wishlistedProducts =
            await wishlistProductsRepo.getWishList();
        emit(WishlistProductsLoaded(wishlistedProducts));
      } catch (_) {
        emit(
          WishlistProductsFailure(
            state.wishlistedProducts,
            msg: 'Error in loading',
          ),
        );
      }
    });

    on<ToggleWishlistProduct>((event, emit) async {
      List<Product> updatedList = List<Product>.from(state.wishlistedProducts);
      int idx = updatedList.indexWhere((p) => p.id == event.productId);
      if (idx >= 0) {
        updatedList.removeAt(idx);
      } else {
        updatedList.add(event.product);
      }
      emit(WishlistProductsUpdated(updatedList));

      try {
        await wishlistProductsRepo.toggleWishlist(event.productId);
      } catch (_) {
        emit(
          WishlistProductsFailure(
            state.wishlistedProducts,
            msg: 'Error in toggle',
          ),
        );
      }
    });
  }
}
