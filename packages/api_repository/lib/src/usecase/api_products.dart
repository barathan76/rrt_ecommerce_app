abstract class ApiProducts {
  Future<List> getProducts();
  Future<List> searchProductsByTitle(String title);
}
