import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AppButtonPrimary extends StatelessWidget {
  final String label;
  final bool isLoading;
  final bool isDisabled;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const AppButtonPrimary({
    super.key,
    required this.label,
    this.isDisabled = false,
    this.width = double.infinity,
    this.height = 45,
    required this.isLoading,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimary,
          foregroundColor: Colors.white,
          elevation: 3,
          shadowColor: AppColors.kPrimary.withValues(alpha: 0.28),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 21,
                width: 21,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  color: Colors.white,
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.1,
                ),
              ),
      ),
    );
  }
}
