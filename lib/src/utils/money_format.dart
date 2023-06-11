import 'package:money_formatter/money_formatter.dart';

String formatMoney(int amount) {
  return MoneyFormatter(
    amount: amount.toDouble(),
    settings: MoneyFormatterSettings(
      symbol: 'Rp',
      thousandSeparator: '.',
      decimalSeparator: ',',
      symbolAndNumberSeparator: '',
      fractionDigits: 0,
    ),
  ).output.symbolOnLeft;
}
