import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smol_telaproduto_felipe/core/domain/models/additionals_model.dart';
import 'package:smol_telaproduto_felipe/core/domain/models/finished_product_model.dart';
import 'package:smol_telaproduto_felipe/core/domain/models/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

  void init() {
    emit(const ProductState());
    emit(
      state.copyWith(
        finishProduct: state.finishProduct.copyWith(
          product: state.product,
        ),
      ),
    );
  }

  void incrementProduct() {
    emit(
      state.copyWith(
        finishProduct: state.finishProduct.copyWith(
          amountProducts: state.finishProduct.amountProducts + 1,
        ),
      ),
    );
  }

  void decrementProduct() {
    emit(
      state.copyWith(
        finishProduct: state.finishProduct.copyWith(
          amountProducts: state.finishProduct.amountProducts >= 2
              ? state.finishProduct.amountProducts - 1
              : 1,
        ),
      ),
    );
  }

  void addAdditionals(AdditionalModel additionals) {
    emit(
      state.copyWith(
        finishProduct: state.finishProduct.copyWith(
          additionals: [...state.finishProduct.additionals, additionals],
        ),
      ),
    );
  }

  void removeAdditionals(AdditionalModel additional) {
    final additionals = state.finishProduct.additionals.where(
      (element) => element == additional,
    );

    emit(
      state.copyWith(
        finishProduct: state.finishProduct.copyWith(
          additionals: [
            ...additionals.skip(1),
            ...state.finishProduct.additionals.where(
              (element) => element != additional,
            )
          ],
        ),
      ),
    );
  }

  double getTotalAdditionalPrice(AdditionalModel additional) {
    final additionals = [
      ...state.finishProduct.additionals
          .where((element) => element == additional)
    ];
    var additionalPrice = 0.0;

    for (var i in additionals) {
      additionalPrice += i.price;
    }

    return additionalPrice;
  }

  bool submit() {
    if (state.finishProduct.additionals.length >= 3) {
      return true;
    }
    return false;
  }
}
