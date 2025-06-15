final backEndl = 'http://192.168.1.6:8080/api/';
final backEnd2 = 'http://10.30.154.29:8080/api/';

final backend = backEnd2;

final registerUrl = Uri.parse('${backend}auth/register');

final loginUrl = Uri.parse('${backend}auth/login');

final logoutUrl = Uri.parse('${backend}auth/logout');

final getProductsUrl = Uri.parse('${backend}products/get_products');

final getCartUrl = Uri.parse('${backend}user/cart');
final deleteCartItemUrl = Uri.parse('${backend}user/cart/remove');

final addCartItemUrl = Uri.parse('${backend}user/cart/add');
final updateCartItemUrl = Uri.parse('${backend}user/cart/update');

final userProfileUrl = Uri.parse('${backend}user/profile');

final addressUrl = Uri.parse('${backend}address');

Uri addressUrlId(int id) => Uri.parse('${backend}address/$id');

Uri removeCartItem(int productId) =>
    Uri.parse('${backend}user/cart/remove/$productId');

Uri searchProducts(String title) =>
    Uri.parse('${backend}products/search/$title');

Uri clearCartUrl = Uri.parse('${backend}user/cart/clear');

final placeOrderUrl = Uri.parse("${backend}user/order/place");

final getUserOrdersUrl = Uri.parse("${backend}user/order/all");

Uri wishlistUrl = Uri.parse('${backend}user/wishlist');

Uri toogleWishlistUrl(int productId) =>
    Uri.parse('${backend}user/wishlist/toggle/$productId');

Uri checkWishlistUrl(int productId) =>
    Uri.parse('${backend}user/wishlist/check/$productId');

Uri getSelectedAddressUrl = Uri.parse('${backend}user/selected-address');

Uri selectAddressUrl(int id) =>
    Uri.parse('${backend}user/selected-address/select/$id');
