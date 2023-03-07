import 'package:flutter/material.dart';
import 'package:smol_telaproduto_felipe/core/routes/app_router.dart';
import 'package:smol_telaproduto_felipe/core/ui/typography.dart';

class CustomDialog {
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    String? description,
    String buttonLabel = '',
    bool? isNegativeAction,
  }) async {
    return _baseDialog(
      context: context,
      child: Builder(builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: 100,
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                radius: 100,
                child: const Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.grey,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Center(
                    child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: FittedBox(
                    child: Text(
                      title,
                      maxLines: 1,
                    ).regularExtraBold(),
                  ),
                )),
                if (isNegativeAction == true)
                  ElevatedButton(
                    child: Text(buttonLabel),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  )
                else
                  ElevatedButton(
                    child: Text(buttonLabel),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        );
      }),
    );
  }

  static Future<T?> _baseDialog<T>({
    required BuildContext context,
    required Widget child,
    EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 10),
    bool hasRedBorder = false,
  }) async {
    return showDialog<T>(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 56),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, -2),
                      blurRadius: 80,
                      spreadRadius: 15,
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  border: hasRedBorder
                      ? Border.all(color: Colors.deepPurple)
                      : null,
                ),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> additionalsError({required BuildContext context}) async {
    final width = MediaQuery.of(context).size.width;

    return _baseDialog(
      context: context,
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'Quantidade incorreta',
                    textAlign: TextAlign.center,
                  ).extraBold(const Color(0xFF8D8B8B)),
                  const SizedBox(height: 5),
                  const Text(
                    'Você precisa escolher pelo menos 3 adicionais para continuar.',
                    textAlign: TextAlign.center,
                  ).smallRegular(const Color(0xFF8D8B8B)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(149.91, 38.78)),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFF28D45E)),
                    ),
                    child: const Text('Voltar'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(149.91, 38.78)),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFFF0000)),
                    ),
                    child: const Text('Fechar'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> additionalsSucesses(
      {required BuildContext context}) async {
    final width = MediaQuery.of(context).size.width;

    return _baseDialog(
      context: context,
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'Produto adicionado com sucesso',
                    textAlign: TextAlign.center,
                  ).extraBold(const Color(0xFF8D8B8B)),
                  const SizedBox(height: 5),
                  const Text(
                    'Sucesso, você adicionou o produto no carrinho!',
                    textAlign: TextAlign.center,
                  ).smallRegular(const Color(0xFF8D8B8B)),
                ],
              ),
              Center(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(149.91, 38.78)),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFF28D45E)),
                  ),
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRouter.splash,
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
