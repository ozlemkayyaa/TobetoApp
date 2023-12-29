class TValidator {
  // E-posta doğrulaması yapan fonksiyon
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required.";
    } else {
      return null; // Geçerli durumda null döndür
    }
  }

  // Şifre doğrulaması yapan fonksiyon
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required.";
    }

    // Şifre uzunluğunu kontrol et
    if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    return null;
  }

  // Telefon numarası doğrulaması yapan fonksiyon
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required.";
    }
    // Telefon numarası uzunluğunu kontrol et
    if (value.length < 10) {
      // Örnek: (123)456-78-90
      return 'Invalid phone number format (10 digits required).';
    }
    return null;
  }
}
