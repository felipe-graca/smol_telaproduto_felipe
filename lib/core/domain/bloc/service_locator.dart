import 'package:get_it/get_it.dart';
import 'package:smol_telaproduto_felipe/pages/product/product_cubit.dart';

class ServiceLocator {
  static Future<void> setup() async {
    final i = GetIt.instance;

    i.registerLazySingleton(() => ProductCubit());
  }
}
