import 'package:flutter/material.dart';
import 'package:smol_telaproduto_felipe/core/ui/colors.dart';
import 'package:smol_telaproduto_felipe/core/ui/icons/custom_icons.dart';
import 'package:smol_telaproduto_felipe/core/ui/typography.dart';

class ProductSideBar extends StatelessWidget {
  const ProductSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: CustomColors.green3,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  CustomIcon.minusCircle,
                  size: 15,
                  color: CustomColors.green2,
                ),
                const SizedBox(width: 10),
                const Text('1').regularBold(Colors.white),
                const SizedBox(width: 10),
                const Icon(
                  CustomIcon.plusCircle,
                  size: 15,
                  color: CustomColors.green2,
                ),
              ],
            ),
            const Text('R\$ 4,50').regularBold(Colors.white),
            Container(
              width: 105,
              height: 28,
              decoration: const BoxDecoration(
                color: CustomColors.green1,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Center(
                child: const Text('Adicionar').regularExtraBold(Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
