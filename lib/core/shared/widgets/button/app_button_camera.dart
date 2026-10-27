import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AppButtonCamera extends StatelessWidget {
  final bool isLoading;
  final bool isDisabled;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const AppButtonCamera({
    super.key,
    this.isDisabled = false,
    this.width = double.infinity,
    this.height = 63,
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
          shape: CircleBorder(),
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
            : const CircleAvatar(
                radius: 35,
                backgroundColor: AppColors.kBlueLight,
                child: Icon(Icons.camera, size: 35, color: AppColors.kPrimary),
              ),
      ),
    );
  }
}
