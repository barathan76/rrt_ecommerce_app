final backEndl = 'https://localhost:8080/api/';
final backEnd2 = 'http://10.30.154.125:8080/api/';

final backend = backEnd2;

final registerUrl = Uri.parse('${backend}auth/register');

final loginUrl = Uri.parse('${backend}auth/login');

final logoutUrl = Uri.parse('${backend}auth/logout');

final getProductsUrl = Uri.parse('${backend}products/get_products');

final getCartUrl = Uri.parse('${backend}cart/cart_items');
final removeCartItemUrl = Uri.parse('${backend}cart/remove_cart_item');

final setCartItemCountUrl = Uri.parse('${backend}cart/set_cart_item_count');
