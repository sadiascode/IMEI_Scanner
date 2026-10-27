import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class BarcodeShimmer extends StatelessWidget {
  const BarcodeShimmer({super.key});

  static const int _barCount = 10;
  static const double _barWidth = 9;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int index = 0; index < _barCount; index++) ...[
          const _BarcodeBar(),
          if (index != _barCount - 1) const SizedBox(width: 3),

          if (index % 2 == 0) const SizedBox(width: 7),
        ],
      ],
    );
  }
}

class _BarcodeBar extends StatelessWidget {
  const _BarcodeBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: BarcodeShimmer._barWidth,
      height: 35,
      decoration: BoxDecoration(
        color: AppColors.kTextGrey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
