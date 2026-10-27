import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AppSnackBar {
  static void show(
    ScaffoldMessengerState messenger, {
    required String message,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor ?? AppColors.kPrimary,
          behavior: SnackBarBehavior.floating,
          duration: duration,
          content: Text(
            message,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      );
  }
}

extension SnackBarExtension on ScaffoldMessengerState {
  ScaffoldFeatureController showAppSnackBar(
    String message, {
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    hideCurrentSnackBar();

    return showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor ?? AppColors.kPrimary,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
