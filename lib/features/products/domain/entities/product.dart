import 'package:ecommerse_getx/features/products/domain/entities/dimensions.dart';
import 'package:ecommerse_getx/features/products/domain/entities/meta.dart';
import 'package:ecommerse_getx/features/products/domain/entities/review.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final int stock;
  final Dimensions dimensions;
  final List<Review> reviews;
  final Meta meta;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.stock,
    required this.dimensions,
    required this.reviews,
    required this.meta,
  });
}