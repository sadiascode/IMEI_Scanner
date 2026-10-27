import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import 'barcode_shimmer.dart';
import 'text_label.dart';

class BarcodePlaceholder extends StatelessWidget {
  const BarcodePlaceholder({super.key, required this.onTap, required this.isScanned});

  final Future<void> Function() onTap;
  final bool isScanned;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 215,
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.kBlueLight.withValues(alpha: 0.35),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.kPrimary),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10),
              const BarcodeShimmer(),
              const TextLabel(),
            ],
          ),
        ),
      ),
    );
  }
}
