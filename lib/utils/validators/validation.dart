class TValidator {
  // Ad/Soayad doğrulaması yapan fonksiyon
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Bu alan boş bırakılamaz.";
    }
    return null; // Geçerli durumda null döndür
  }

  // E-posta doğrulaması yapan fonksiyon
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Lütfen E-Posta adresinizi giriniz.";
    }
    return null; // Geçerli durumda null döndür
  }

  // Şifre doğrulaması yapan fonksiyon
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Şifre boş bırakılamaz.";
    }

    // Şifre uzunluğunu kontrol et
    if (value.length < 8) {
      return 'Şifreniz 8 karakterli olmalıdır.';
    }
    return null;
  }

  // Telefon numarası doğrulaması yapan fonksiyon
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Lütfen telefon numaranızı giriniz.";
    }
    // Telefon numarası uzunluğunu kontrol et
    if (value.length < 10) {
      // Örnek: (123)456-78-90
      return 'Telefon numarası 10 karakterli olmalıdır.';
    }
    return null;
  }
}
