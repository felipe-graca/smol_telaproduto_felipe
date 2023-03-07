// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final String name;
  final String description;
  final String image;
  final double price;
  const ProductModel({
    this.name = '',
    this.description = '',
    this.image = '',
    this.price = 0.0,
  });

  ProductModel copyWith({
    String? name,
    String? description,
    String? image,
    double? price,
  }) {
    return ProductModel(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
      'price': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(name: $name, description: $description, image: $image, price: $price)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.image == image &&
        other.price == price;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        image.hashCode ^
        price.hashCode;
  }

  static const empty = ProductModel();

  bool get isEmpty => this == ProductModel.empty;

  bool get isNotEmpty => this != ProductModel.empty;
}
