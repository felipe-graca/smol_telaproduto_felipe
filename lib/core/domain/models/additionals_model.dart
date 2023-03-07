// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdditionalsModel {
  final String name;
  final double price;
  const AdditionalsModel({
    this.name = '',
    this.price = 0.0,
  });

  AdditionalsModel copyWith({
    String? name,
    double? price,
  }) {
    return AdditionalsModel(
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

  factory AdditionalsModel.fromMap(Map<String, dynamic> map) {
    return AdditionalsModel(
      name: map['name'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdditionalsModel.fromJson(String source) =>
      AdditionalsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AdditionalsModel(name: $name, price: $price)';

  @override
  bool operator ==(covariant AdditionalsModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}
