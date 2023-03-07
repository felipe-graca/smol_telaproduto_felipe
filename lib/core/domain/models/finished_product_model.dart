// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:smol_telaproduto_felipe/core/domain/models/additionals_model.dart';
import 'package:smol_telaproduto_felipe/core/domain/models/product_model.dart';

class FinishProductModel {
  final ProductModel product;
  final List<AdditionalModel> additionals;
  final int amountProducts;
  const FinishProductModel({
    this.product = ProductModel.empty,
    this.additionals = const <AdditionalModel>[],
    this.amountProducts = 1,
  });

  FinishProductModel copyWith({
    ProductModel? product,
    List<AdditionalModel>? additionals,
    int? amountProducts,
  }) {
    return FinishProductModel(
      product: product ?? this.product,
      additionals: additionals ?? this.additionals,
      amountProducts: amountProducts ?? this.amountProducts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'additionals': additionals.map((x) => x.toMap()).toList(),
      'amountProducts': amountProducts,
    };
  }

  factory FinishProductModel.fromMap(Map<String, dynamic> map) {
    return FinishProductModel(
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
      additionals: List<AdditionalModel>.from(
        (map['additionals'] as List<int>).map<AdditionalModel>(
          (x) => AdditionalModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      amountProducts: map['amountProducts'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory FinishProductModel.fromJson(String source) =>
      FinishProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FinishProductModel(product: $product, additionals: $additionals, amountProducts: $amountProducts)';

  @override
  bool operator ==(covariant FinishProductModel other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        listEquals(other.additionals, additionals) &&
        other.amountProducts == amountProducts;
  }

  @override
  int get hashCode =>
      product.hashCode ^ additionals.hashCode ^ amountProducts.hashCode;

  static const empty = FinishProductModel();

  bool get isEmpty => this == FinishProductModel.empty;

  bool get isNotEmpty => this != FinishProductModel.empty;

  double get finalPrice {
    double additionalsPrice = 0.0;
    for (var additional in additionals) {
      additionalsPrice += additional.price;
    }
    return (product.price + additionalsPrice) * amountProducts;
  }
}
