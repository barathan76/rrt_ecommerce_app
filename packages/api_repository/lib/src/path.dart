final backEndl = 'http://192.168.1.6:8080/api/';
final backEnd2 = 'http://10.30.154.125:8080/api/';

final backend = backEndl;

final registerUrl = Uri.parse('${backend}auth/register');

final loginUrl = Uri.parse('${backend}auth/login');

final logoutUrl = Uri.parse('${backend}auth/logout');

final getProductsUrl = Uri.parse('${backend}products/get_products');

final getCartUrl = Uri.parse('${backend}cart/cart_items');
final removeCartItemUrl = Uri.parse('${backend}cart/remove_cart_item');

final setCartItemCountUrl = Uri.parse('${backend}cart/set_cart_item_count');

final userProfileUrl = Uri.parse('${backend}user/profile');

final addressUrl = Uri.parse('${backend}address');

Uri addressUrlId(int id) => Uri.parse('${backend}address/$id');
