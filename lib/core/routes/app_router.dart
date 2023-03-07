import 'package:flutter/material.dart';
import 'package:smol_telaproduto_felipe/pages/product/product_page.dart';
import 'package:smol_telaproduto_felipe/pages/splash/splash_page.dart';

class AppRouter {
  static const splash = '/splash';
  static const product = '/product';

  static MaterialPageRoute<dynamic> generateRoute(RouteSettings routeSettings) {
    late final Widget page;

    switch (routeSettings.name) {
      case '/':
      case splash:
        page = const SplashPage();
        break;
      case product:
        page = ProductPage();
        break;
      default:
        page = Container();
    }

    return MaterialPageRoute(
      builder: (_) => page,
      settings: routeSettings,
    );
  }
}
