import 'dart:ffi';

import 'package:shopping_app/model/rating_model.dart';

class Items {
  final int? id;
  final String? title;
  final double? price;
  final String? category;
  final String? description;
  final String? image;
  final Rating? rating;

  Items({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
    this.rating
  });
  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: (json['price'] as num)?.toDouble(),
      category: json['category'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      rating:Rating.fromJson(json['rating'] ?? {})
    );
  }
}
