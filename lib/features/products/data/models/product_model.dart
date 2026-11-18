import 'package:ecommerse_getx/features/products/domain/entities/product.dart';
import 'package:ecommerse_getx/features/products/data/models/dimensions_model.dart';
import 'package:ecommerse_getx/features/products/data/models/meta_model.dart';
import 'package:ecommerse_getx/features/products/data/models/review_model.dart';

class ProductModel extends Product {

  const ProductModel({
    required super.id,
    required super.description,
    required super.title,
    required super.price,
     required super.category,
    required super.rating,
    required super.stock,
    required super.dimensions,
    required super.meta,
    required super.reviews,
    
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      price:( json['price'] as num).toDouble(),
      category: json['category'],
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'],
      dimensions: DimensionsModel.fromJson(json['dimensions']),
      meta: MetaModel.fromJson(json['meta']),
      reviews: (json['reviews'] as List)
        .map((review) => ReviewModel.fromJson(review))
        .toList(),
    );
  }

  Map<String, dynamic> toJson() {
  return {
    'id': id,
    'title': title,
    'description': description,
    'category': category,
    'price': price,
    'rating': rating,
    'stock': stock,

    'dimensions': DimensionsModel(
      width: dimensions.width,
      height: dimensions.height,
      depth: dimensions.depth,
    ).toJson(),

    'reviews': reviews.map((review) {
      return ReviewModel(
        rating: review.rating,
        comment: review.comment,
        date: review.date,
        reviewerName: review.reviewerName,
        reviewerEmail: review.reviewerEmail,
      ).toJson();
    }).toList(),

    'meta': MetaModel(
      createdAt: meta.createdAt,
      updatedAt: meta.updatedAt,
      barcode: meta.barcode,
      qrCode: meta.qrCode,
    ).toJson(),
  };
}
}


 