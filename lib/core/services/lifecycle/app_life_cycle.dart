import 'package:flutter/services.dart';

class AppLifecycle {
  static const _channel = MethodChannel('app_lifecycle');

  static Future<void> moveToBackground() async {
    await _channel.invokeMethod('moveToBackground');
  }
}
