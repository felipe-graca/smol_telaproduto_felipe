import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smol_telaproduto_felipe/core/routes/app_router.dart';
import 'package:smol_telaproduto_felipe/ui/widgets/custom_search_bar.dart.dart';
import 'package:smol_telaproduto_felipe/pages/product/components/additionals_component.dart';
import 'package:smol_telaproduto_felipe/pages/product/components/product_side_bar_component.dart';
import 'package:smol_telaproduto_felipe/pages/product/components/product_view_component.dart';
import 'package:smol_telaproduto_felipe/pages/product/product_cubit.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final productCubit = GetIt.I.get<ProductCubit>();

  @override
  void initState() {
    productCubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        bloc: productCubit,
        builder: (context, state) {
          return Column(
            children: [
              SafeArea(
                child: SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: widht,
                          child: Image.asset(
                            'assets/images/background_store.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      CustomSearchBar(
                        onBackTap: () =>
                            Navigator.of(context).pushNamed(AppRouter.splash),
                      ),
                      Positioned(
                        top: 75,
                        left: (widht / 2) - 50.5,
                        child: Image.asset(
                          'assets/images/logo_store.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 56),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child:
                                  ProductViewComponent(product: state.product),
                            ),
                            const SizedBox(height: 10),
                            AdditionalsComponent(
                                additionals: state.additionals),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ProductSideBarComponent(
                        finishProduct: state.finishProduct,
                        incrementProduct: () => productCubit.incrementProduct(),
                        decrementProduct: () => productCubit.decrementProduct(),
                        validateProduct: () => productCubit.submit(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
