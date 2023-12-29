import 'package:intl/intl.dart';

class TFormatter {
  // Tarih nesnesini belirli bir formata göre biçimlendiren fonksiyon
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  // Telefon numarasını belirli bir formata göre biçimlendiren fonksiyon
  static String formatPhoneNumber(String phoneNumber) {
    // 10 haneli bir telefon numarası formatı: (123) 456-78-90
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
      // 11 haneli bir telefon numarası formatı: (0123) 456-78-90
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }
}
