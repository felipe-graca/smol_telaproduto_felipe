// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_cubit.dart';

class ProductState extends Equatable {
  final ProductModel product;
  final List<AdditionalsModel> additionals;

  const ProductState({
    this.product = ProductModel.empty,
    this.additionals = const <AdditionalsModel>[
      AdditionalsModel(name: 'Morango', price: 1.25),
      AdditionalsModel(name: 'Granulado', price: 1.25),
      AdditionalsModel(name: 'Ninho', price: 1.25),
    ],
  });

  @override
  List<Object?> get props => [];

  ProductState copyWith({
    String? location,
    ProductModel? product,
    List<AdditionalsModel>? additionals,
  }) {
    return ProductState(
      product: product ?? this.product,
      additionals: additionals ?? this.additionals,
    );
  }
}
