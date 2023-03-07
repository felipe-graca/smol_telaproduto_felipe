import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smol_telaproduto_felipe/core/domain/models/additionals_model.dart';
import 'package:smol_telaproduto_felipe/core/helpers/app_ui.dart';
import 'package:smol_telaproduto_felipe/core/ui/colors.dart';
import 'package:smol_telaproduto_felipe/core/ui/icons/custom_icons.dart';
import 'package:smol_telaproduto_felipe/core/ui/typography.dart';
import 'package:smol_telaproduto_felipe/pages/product/product_cubit.dart';

class Additionals extends StatelessWidget {
  final List<AdditionalModel> additionals;
  const Additionals({
    required this.additionals,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productCubit = GetIt.I.get<ProductCubit>();
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
                    const Text("escolha até 3 itens")
                        .regularMedium(CustomColors.green1),
                    const SizedBox(width: 5),
                    Container(
                      width: 59.87,
                      height: 15,
                      decoration: const BoxDecoration(
                          color: Color(0xFFFF4B4B),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Center(
                        child: const Text('OBRIGATORIO')
                            .lightRegular(Colors.white),
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
          child: BlocBuilder<ProductCubit, ProductState>(
            bloc: productCubit,
            builder: (context, state) {
              return Stack(
                children: [
                  Column(
                    children: [
                      ...additionals
                          .map((e) => Container(
                                height: 42,
                                decoration: const BoxDecoration(
                                  color: CustomColors.green4,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                  ),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 1, left: .7),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(e.name).regularMedium(),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 70,
                                              child: Text(
                                                state.finishProduct.additionals
                                                        .where(
                                                          (element) =>
                                                              element == e,
                                                        )
                                                        .isEmpty
                                                    ? '+ ${AppUI.formatCurrencyPtBr(e.price)}'
                                                    : '+ ${AppUI.formatCurrencyPtBr(productCubit.getTotalAdditionalPrice(e))}',
                                                textAlign: TextAlign.start,
                                              ).regularMedium(
                                                state.finishProduct.additionals
                                                        .where((element) =>
                                                            element == e)
                                                        .isNotEmpty
                                                    ? CustomColors.green3
                                                    : null,
                                              ),
                                            ),
                                            if (state.finishProduct.additionals
                                                .where(
                                                    (element) => element == e)
                                                .isEmpty)
                                              const SizedBox(width: 75)
                                            else
                                              const SizedBox(width: 20),
                                            if (state.finishProduct.additionals
                                                .where(
                                                    (element) => element == e)
                                                .isEmpty)
                                              InkWell(
                                                onTap: () => GetIt.I
                                                    .get<ProductCubit>()
                                                    .addAdditionals(e),
                                                child: const Icon(
                                                  CustomIcon.plusCircle,
                                                  size: 14,
                                                  color: CustomColors.green3,
                                                ),
                                              )
                                            else
                                              Container(
                                                width: 69,
                                                height: 21.16,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                      color:
                                                          CustomColors.green3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        offset: Offset(0, 1),
                                                        blurRadius: 5,
                                                        color: Color.fromARGB(
                                                            50, 0, 0, 0),
                                                      )
                                                    ]),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () => productCubit
                                                          .removeAdditionals(
                                                        e,
                                                      ),
                                                      child: const Icon(
                                                        CustomIcon.minusCircle,
                                                        size: 14,
                                                        color:
                                                            CustomColors.green3,
                                                      ),
                                                    ),
                                                    Text(
                                                      state.finishProduct
                                                          .additionals
                                                          .where((element) =>
                                                              element == e)
                                                          .length
                                                          .toString(),
                                                    ).regularSemiBold(
                                                        CustomColors.green3),
                                                    InkWell(
                                                      onTap: () => productCubit
                                                          .addAdditionals(
                                                        e,
                                                      ),
                                                      child: const Icon(
                                                        CustomIcon.plusCircle,
                                                        size: 14,
                                                        color:
                                                            CustomColors.green3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList()
                    ],
                  ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: additionals.length,
                  //   itemBuilder: (context, index) {
                  //     return
                  //   },
                  // ),
                  Container(
                    decoration: const BoxDecoration(color: CustomColors.green4),
                    width: 1,
                    height: (42 * 3) - 10,
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
