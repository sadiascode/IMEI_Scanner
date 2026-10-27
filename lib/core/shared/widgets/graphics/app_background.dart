import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import 'bg_glow.dart';

class AppBackground {
  List<Widget> build() {
    return [
      // Soft background graphics
      Positioned(
        left: -70,
        top: -90,
        child: BgGlow(
          color: AppColors.kPrimary.withValues(alpha: 0.18),
          width: 270,
          height: 270,
        ),
      ),
      Positioned(
        right: -85,
        top: 180,
        child: BgGlow(
          color: AppColors.kAccent.withValues(alpha: 0.15),
          width: 270,
          height: 270,
        ),
      ),
      Positioned(
        left: -110,
        bottom: -130,
        child: BgGlow(
          color: AppColors.kPrimary.withValues(alpha: 0.09),
          width: 300,
          height: 300,
        ),
      ),
    ];
  }
}
