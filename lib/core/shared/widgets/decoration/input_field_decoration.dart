import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class InputFieldDecoration {
  final String label;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffixIcon;

  const InputFieldDecoration({
    required this.label,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
  });

  InputDecoration build() {
    return InputDecoration(
      labelText: label,
      prefixIcon: prefixIcon,
      prefixText: prefixText == null ? '' : "$prefixText ",
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppColors.kWhite.withValues(alpha: 0.55),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      labelStyle: TextStyle(
        color: AppColors.kBlack.withValues(alpha: 0.55),
        fontSize: 12.5,
        fontWeight: FontWeight.w600,
      ),
      hintStyle: TextStyle(
        color: AppColors.kBlack.withValues(alpha: 0.38),
        fontSize: 13,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.kAccent.withValues(alpha: 0.28),
          width: 1,
        ),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.kAccent.withValues(alpha: 0.28),
          width: 1,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.kPrimary, width: 1.5),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.kAccent.withValues(alpha: 0.75),
          width: 1.2,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.kAccent, width: 1.5),
      ),

      errorStyle: TextStyle(
        color: AppColors.kAccent.withValues(alpha: 0.9),
        fontSize: 10.5,
        fontWeight: FontWeight.w600,
      ),

      suffixIconColor: AppColors.kBlack.withValues(alpha: 0.65),
    );
  }
}
