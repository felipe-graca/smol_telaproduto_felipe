// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:smol_telaproduto_felipe/core/domain/models/additionals_model.dart';
import 'package:smol_telaproduto_felipe/core/domain/models/product_model.dart';

class FinishProductModel {
  final ProductModel product;
  final List<AdditionalsModel> additionals;
  FinishProductModel({
    required this.product,
    required this.additionals,
  });

  FinishProductModel copyWith({
    ProductModel? product,
    List<AdditionalsModel>? additionals,
  }) {
    return FinishProductModel(
      product: product ?? this.product,
      additionals: additionals ?? this.additionals,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'additionals': additionals.map((x) => x.toMap()).toList(),
    };
  }

  factory FinishProductModel.fromMap(Map<String, dynamic> map) {
    return FinishProductModel(
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
      additionals: List<AdditionalsModel>.from(
        (map['additionals'] as List<int>).map<AdditionalsModel>(
          (x) => AdditionalsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FinishProductModel.fromJson(String source) =>
      FinishProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FinishProductModel(product: $product, additionals: $additionals)';

  @override
  bool operator ==(covariant FinishProductModel other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        listEquals(other.additionals, additionals);
  }

  @override
  int get hashCode => product.hashCode ^ additionals.hashCode;
}
