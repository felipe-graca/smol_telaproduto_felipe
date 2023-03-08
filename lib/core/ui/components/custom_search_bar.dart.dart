import 'package:flutter/material.dart';
import 'package:smol_telaproduto_felipe/core/ui/custom_colors.dart';
import 'package:smol_telaproduto_felipe/core/ui/icons/custom_icons.dart';
import 'package:smol_telaproduto_felipe/core/ui/custom_typography.dart';

class CustomSearchBar extends StatelessWidget {
  final Function()? onBack;

  const CustomSearchBar({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      height: 40,
      decoration: const BoxDecoration(color: CustomColors.yellow4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onBack,
                icon: const Icon(
                  size: 15,
                  CustomIcon.arrowBack,
                  color: CustomColors.green2,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                size: 15,
                CustomIcon.location,
                color: CustomColors.green2,
              ),
              const SizedBox(width: 5),
              const Text('Rua França Pinto, 406 - Vila Mariana').semiRegular(
                Colors.black.withOpacity(0.85),
              ),
              const SizedBox(width: 5),
              const Padding(
                padding: EdgeInsets.only(top: 3),
                child: Icon(
                  size: 3,
                  CustomIcon.arrowDown,
                  color: CustomColors.green2,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CustomIcon.search,
              size: 15,
              color: CustomColors.green2,
            ),
          )
        ],
      ),
    );
  }
}
