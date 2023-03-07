import 'package:flutter/material.dart';
import 'package:smol_telaproduto_felipe/core/domain/models/additionals_model.dart';
import 'package:smol_telaproduto_felipe/core/ui/colors.dart';
import 'package:smol_telaproduto_felipe/core/ui/icons/custom_icons.dart';
import 'package:smol_telaproduto_felipe/core/ui/typography.dart';

class Additionals extends StatelessWidget {
  final List<AdditionalsModel> additionals;
  const Additionals({
    required this.additionals,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          decoration: const BoxDecoration(color: CustomColors.yellow4),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Adicionais").regularMedium(CustomColors.green1),
                Row(
                  children: [
                    const Text("complete o seu pedido")
                        .regularMedium(CustomColors.green1),
                    const SizedBox(width: 5),
                    Container(
                      width: 59.87,
                      height: 15,
                      decoration: const BoxDecoration(
                          color: CustomColors.green3,
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Center(
                        child:
                            const Text('OPCIONAL').lightRegular(Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Stack(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: additionals.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 42,
                    decoration: const BoxDecoration(
                      color: CustomColors.green4,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 1, left: .7),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(additionals[index].name).regularMedium(),
                            Row(
                              children: [
                                Text('+ R\$${additionals[index].price.toString()}')
                                    .regularMedium(),
                                const SizedBox(width: 30),
                                const Icon(
                                  CustomIcon.plusCircle,
                                  size: 14,
                                  color: CustomColors.green3,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                decoration: const BoxDecoration(color: CustomColors.green4),
                width: 1,
                height: (42 * 3) - 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}
