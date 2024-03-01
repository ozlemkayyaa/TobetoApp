import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tobeto/screens/quiz/quiz_screen.dart';

class THelperFunctions {
// SnackBar gösteren fonksiyon
  static void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

// AlertDialog gösteren fonksiyon
  static void showAlert(String title, String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  // AlertDialog gösteren fonksiyon
  static void showAlert2(String title, String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => const QuizScreen(),
                ),
              ),
              child: const Text('SINAVA BAŞLA'),
            ),
          ],
        );
      },
    );
  }

// Ekranlar arasında gezinmeyi sağlayan fonksiyon
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

// Metni belirli bir uzunlukta kesen fonksiyon
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

// Tema modunun dark mı yoksa light mı olduğunu kontrol eden fonksiyon
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

// Ekran boyutunu döndüren fonksiyonlar
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

// Tarih formatını düzenleyen fonksiyon
  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }
}
