import 'package:products_repository/src/model/rating.dart';
import 'package:api_repository/api_repository.dart' show backend;

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final Rating rating;
  bool wishlist;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.rating,
    this.wishlist = false,
  });

  String get imageUrl => Uri.parse('${backend}products/$id/image').toString();

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      price: double.parse(map['price'].toString()),
      description: map['description'] as String,
      category: map['category'] as String,
      rating: Rating.fromMap(map['rating'] as Map<String, dynamic>),
    );
  }
  @override
  String toString() {
    return '{id : $id, title : $title, price : $price}';
  }
}
