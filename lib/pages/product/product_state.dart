// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_cubit.dart';

class ProductState extends Equatable {
  final ProductModel product;
  final List<AdditionalModel> additionals;
  final FinishProductModel finishProduct;

  const ProductState({
    this.product = const ProductModel(
      name: 'Bombom 1',
      description: 'Doce de chocolate',
      image: 'assets/images/bombom.png',
      price: 4.50,
    ),
    this.additionals = const <AdditionalModel>[
      AdditionalModel(name: 'Morango', price: 1.25),
      AdditionalModel(name: 'Granulado', price: 1.25),
      AdditionalModel(name: 'Ninho', price: 1.25),
    ],
    this.finishProduct = FinishProductModel.empty,
  });

  @override
  List<Object?> get props => [
        product,
        additionals,
        finishProduct,
      ];

  ProductState copyWith({
    ProductModel? product,
    List<AdditionalModel>? additionals,
    FinishProductModel? finishProduct,
  }) {
    return ProductState(
      product: product ?? this.product,
      additionals: additionals ?? this.additionals,
      finishProduct: finishProduct ?? this.finishProduct,
    );
  }

  bool get hasMoreThreeAddictionals => finishProduct.additionals.length > 3;
}
