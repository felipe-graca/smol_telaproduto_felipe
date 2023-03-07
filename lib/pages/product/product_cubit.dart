import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smol_telaproduto_felipe/core/domain/models/additionals_model.dart';
import 'package:smol_telaproduto_felipe/core/domain/models/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());
}
