import 'package:tobeto/utils/constants/texts.dart';

class TValidator {
  // Ad/Soayad doğrulaması yapan fonksiyon
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return TTexts.validation;
    }
    return null; // Geçerli durumda null döndür
  }

  // E-posta doğrulaması yapan fonksiyon
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return TTexts.validationEmail;
    }
    return null; // Geçerli durumda null döndür
  }

  // Şifre doğrulaması yapan fonksiyon
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return TTexts.validatePassword;
    }

    // Şifre uzunluğunu kontrol et
    if (value.length < 8) {
      return TTexts.validatePassword2;
    }
    return null;
  }

  // Telefon numarası doğrulaması yapan fonksiyon
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return TTexts.validatePhone;
    }
    // Telefon numarası uzunluğunu kontrol et
    if (value.length < 10) {
      // Örnek: (123)456-78-90
      return TTexts.validatePhone2;
    }
    return null;
  }
}
