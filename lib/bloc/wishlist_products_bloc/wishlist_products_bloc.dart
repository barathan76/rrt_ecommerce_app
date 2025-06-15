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
      try {
        await wishlistProductsRepo.toggleWishlist(event.productId);
        List<Product> wishlistedProducts =
            await wishlistProductsRepo.getWishList();
        emit(WishlistProductsUpdated(wishlistedProducts));
      } catch (_) {
        emit(
          WishlistProductsFailure(
            state.wishlistedProducts,
            msg: 'Error in toggle',
          ),
        );
      }
    });

    on<AddWishlistProduct>((event, emit) async {
      try {
        state.wishlistedProducts.firstWhere((x) => x.id == event.productId);
      } catch (_) {
        await wishlistProductsRepo.toggleWishlist(event.productId);
        List<Product> wishlistedProducts =
            await wishlistProductsRepo.getWishList();
        emit(WishlistProductsUpdated(wishlistedProducts));
      }
    });
  }
}
