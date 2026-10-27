import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AppOverlayLoader {
  static void show(
    BuildContext context, {
    String message = 'Please Wait, Saving...',
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      barrierLabel: 'Processing...',
      builder: (_) {
        return PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: Colors.white.withValues(alpha: 0.77),
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: AppColors.kPrimary),
                  SizedBox(width: 21),
                  Expanded(child: Text(message, softWrap: true)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
