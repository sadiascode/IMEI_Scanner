import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isRequired;
  final double? titleFontSize;
  final double? subtitleFontSize;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.isRequired = false,
    this.titleFontSize = 15,
    this.subtitleFontSize = 12.5,
  }) : super();

  @override
  Widget build(BuildContext context) {
    if (subtitle != null) {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: isRequired
                ? RichText(
                    text: TextSpan(
                      text: title,
                      style: TextStyle(
                        color: AppColors.kBlack,
                        fontSize: titleFontSize,
                      ),
                      children: const [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: AppColors.kRed),
                        ),
                      ],
                    ),
                  )
                : Text(
                    title,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kBlack.withValues(alpha: 0.78),
                    ),
                  ),
          ),
          if (subtitle != null)
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subtitle!,
                style: TextStyle(
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.w300,
                  color: AppColors.kAccent.withValues(alpha: 0.85),
                ),
              ),
            ),
        ],
      );
    }
    // return only title
    return Align(
      alignment: Alignment.centerLeft,
      child: isRequired
          ? RichText(
              text: TextSpan(
                text: title,
                style: TextStyle(
                  color: AppColors.kBlack,
                  fontSize: titleFontSize,
                ),
                children: const [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: AppColors.kRed),
                  ),
                ],
              ),
            )
          : Text(
              title,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
                color: AppColors.kBlack.withValues(alpha: 0.78),
              ),
            ),
    );
  }
}
