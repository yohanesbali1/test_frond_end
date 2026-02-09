import 'package:intl/intl.dart';

class Helper {
  static String formatRupiah(double amount, {bool withRp = true}) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: withRp ? 'Rp ' : '',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }
}
