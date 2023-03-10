import 'package:flutter/material.dart';
import 'package:smol_telaproduto_felipe/core/domain/models/finished_product_model.dart';
import 'package:smol_telaproduto_felipe/core/helpers/app_ui.dart';
import 'package:smol_telaproduto_felipe/ui/styles/custom_colors.dart';
import 'package:smol_telaproduto_felipe/ui/styles/custom_typography.dart';
import 'package:smol_telaproduto_felipe/ui/widgets/custom_dialogs.dart';
import 'package:smol_telaproduto_felipe/ui/icons/custom_icons.dart';

class ProductSideBarComponent extends StatelessWidget {
  final FinishProductModel finishProduct;
  final Function() incrementProduct;
  final Function() decrementProduct;
  final bool Function() validateProduct;

  const ProductSideBarComponent({
    required this.finishProduct,
    required this.decrementProduct,
    required this.incrementProduct,
    required this.validateProduct,
    super.key,
  });

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
                InkWell(
                  onTap: decrementProduct,
                  child: const Icon(
                    CustomIcon.minusCircle,
                    size: 15,
                    color: CustomColors.green2,
                  ),
                ),
                const SizedBox(width: 10),
                Text(finishProduct.amountProducts.toString())
                    .regularBold(Colors.white),
                const SizedBox(width: 10),
                InkWell(
                  onTap: incrementProduct,
                  child: const Icon(
                    CustomIcon.plusCircle,
                    size: 15,
                    color: CustomColors.green2,
                  ),
                ),
              ],
            ),
            Text(AppUI.formatCurrencyPtBr(finishProduct.finalPrice))
                .regularBold(Colors.white),
            InkWell(
              child: Container(
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
              ),
              onTap: () async {
                if (validateProduct()) {
                  CustomDialog.additionalsSucesses(
                    context: context,
                  );
                  return;
                }
                await CustomDialog.additionalsError(
                  context: context,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
