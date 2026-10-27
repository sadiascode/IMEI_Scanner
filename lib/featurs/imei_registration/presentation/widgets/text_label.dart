import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class TextLabel extends StatelessWidget {
  const TextLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: const Text(
        'Scan the IMEI barcode on the box',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.3,
          color: AppColors.kTextGrey,
        ),
      ),
    );
  }
}
