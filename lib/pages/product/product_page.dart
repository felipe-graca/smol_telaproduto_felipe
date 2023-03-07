import 'package:flutter/material.dart';
import 'package:smol_telaproduto_felipe/core/routes/app_router.dart';
import 'package:smol_telaproduto_felipe/core/ui/components/custom_search_bar.dart.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: ListView(
          children: [
            CustomSearchBar(
              onBack: () => Navigator.of(context).pushNamed(AppRouter.splash),
            )
          ],
        ),
      ),
    );
  }
}
