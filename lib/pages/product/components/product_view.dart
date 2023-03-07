import 'package:flutter/material.dart';
import 'package:smol_telaproduto_felipe/core/domain/models/product_model.dart';
import 'package:smol_telaproduto_felipe/core/ui/colors.dart';
import 'package:smol_telaproduto_felipe/core/ui/icons/custom_icons.dart';
import 'package:smol_telaproduto_felipe/core/ui/typography.dart';

class ProductView extends StatelessWidget {
  final ProductModel product;

  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 341,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(top: 126),
              height: 213,
              decoration: BoxDecoration(
                border: Border.all(color: CustomColors.green4, width: 1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(product.name).regularMedium(),
                            const SizedBox(width: 20),
                            Text(product.price.toString()).regularMedium(
                              CustomColors.green2,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(product.description).regularMedium(),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CustomIcon.heart,
                        color: Color(0xFFFF0000),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 254,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: const Color(0xFFC4C4C4),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
