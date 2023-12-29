import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceUtility {
  // Klavyeyi gizler
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // StatusBar rengini ayarlar
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  // Ekranın yatay mı dikey mi olduğunu kontrol eder (yatay ise true, dikey ise false)
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  // Ekranın dikey mi yatay mı olduğunu kontrol eder (dikey ise true, yatay ise false)
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  // Ekranı tam ekran yapar veya eski haline getirir
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  // Ekranın yüksekliğini alır
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Ekranın genişliğini alır
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Cihazın pixel oranını alır
  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  // StatusBar yüksekliğini alır
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  // Bottom Navigation Bar'ın yüksekliğini alır
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  // AppBar'ın yüksekliğini alır
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  // Klavyenin yüksekliğini alır
  static double getKeyboardHeight(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return viewInsets.bottom;
  }

  // Klavye görünür mü? (true: görünür, false: görünmez)
  static Future<bool> isKeyboardVisible(BuildContext context) async {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom > 0;
  }

  // Fiziksel cihaz mı emülatör/mobil simülasyon mu kontrol eder
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  // Telefonu titreştirir
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  // Ekranın yönlendirme tercihlerini belirler
  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  // StatusBar'ı gizler
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  // StatusBar'ı gösterir
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  // İnternet bağlantısı kontrolü
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  // iOS cihaz mı kontrol eder
  static bool isIOS() {
    return Platform.isIOS;
  }

  // Android cihaz mı kontrol eder
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  // Verilen URL'yi açar
  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
