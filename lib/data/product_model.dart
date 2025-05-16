import 'package:rrt_ecommerce_app/data/rating_model.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String imageUrl;
  final Rating rating;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      price: double.parse(map['price'].toString()),
      description: map['description'] as String,
      category: map['category'] as String,
      imageUrl: map['image'] as String,
      rating: Rating.fromMap(map['rating'] as Map<String, dynamic>),
    );
  }
  @override
  String toString() {
    return '{id : $id, title : $title, price : $price}';
  }
}
