// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdditionalModel {
  final String name;
  final double price;
  const AdditionalModel({
    this.name = '',
    this.price = 0.0,
  });

  AdditionalModel copyWith({
    String? name,
    double? price,
  }) {
    return AdditionalModel(
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
    };
  }

  factory AdditionalModel.fromMap(Map<String, dynamic> map) {
    return AdditionalModel(
      name: map['name'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdditionalModel.fromJson(String source) =>
      AdditionalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AdditionalsModel(name: $name, price: $price)';

  @override
  bool operator ==(covariant AdditionalModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}
