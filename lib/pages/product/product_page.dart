import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smol_telaproduto_felipe/core/routes/app_router.dart';
import 'package:smol_telaproduto_felipe/core/ui/components/custom_search_bar.dart.dart';
import 'package:smol_telaproduto_felipe/pages/product/components/additionals.dart';
import 'package:smol_telaproduto_felipe/pages/product/components/product_side_bar.dart';
import 'package:smol_telaproduto_felipe/pages/product/components/product_view.dart';
import 'package:smol_telaproduto_felipe/pages/product/product_cubit.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;

    final productCubit = GetIt.I.get<ProductCubit>();

    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        bloc: productCubit,
        builder: (context, state) {
          return Stack(
            children: [
              ListView(
                children: [
                  SizedBox(
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
                          onBack: () =>
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
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ProductView(product: state.product),
                  ),
                  const SizedBox(height: 20),
                  Additionals(additionals: state.additionals)
                ],
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: ProductSideBar(),
              ),
            ],
          );
        },
      ),
    );
  }
}
