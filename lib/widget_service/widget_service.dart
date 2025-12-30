import 'package:flutter/services.dart';

class WidgetPinService {
  static const platform = MethodChannel('home_widget');

  static Future<bool> pinWidget() async {
    try {
      final result = await platform.invokeMethod('pinWidget');
      return result ?? false;
    } on PlatformException catch (e) {
      print('Xatolik: ${e.message}');
      return false;
    }
  }

  static Future<bool> isSupported() async {
    try {
      final result = await platform.invokeMethod('isPinSupported');
      return result ?? false;
    } catch (e) {
      return false;
    }
  }
}