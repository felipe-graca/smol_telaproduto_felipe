import 'package:intl/intl.dart';

class AppUI {
  AppUI._();

  static String formatCurrencyPtBr(double value) {
    final formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );
    return formatter.format(value);
  }
}
