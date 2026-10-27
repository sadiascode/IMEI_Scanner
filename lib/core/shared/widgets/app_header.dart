import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData icon;
  final bool isLeadingVisible;
  final bool isTrailingVisible;

  const AppHeader({
    super.key,
    required this.title,
    this.subTitle,
    required this.icon,
    this.isLeadingVisible = true,
    this.isTrailingVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    final hasSubtitle = subTitle?.isNotEmpty ?? false;

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 9, 15, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(11, 11, 11, 15),
        decoration: BoxDecoration(
          color: AppColors.kPrimary.withValues(alpha: 0.94),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.kPrimary),
          boxShadow: [
            BoxShadow(
              color: AppColors.kPrimary.withValues(alpha: 0.10),
              blurRadius: 16,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Row(
          children: [
            if (isLeadingVisible) ...[
              _HeaderButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              const SizedBox(width: 5),
            ] else ...[
              const SizedBox(width: 10),
            ],
            // Icon(icon, size: 22, color: AppColors.kWhite),
            // const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                  if (hasSubtitle) ...[
                    const SizedBox(height: 4),
                    Text(
                      subTitle!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kWhite.withValues(alpha: 0.91),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (isTrailingVisible) ...[
              const SizedBox(width: 10),
            ],
          ],
        ),
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderButton({required this.icon, required this.onTap});

  @override

  @override

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        splashColor: AppColors.kWhite.withValues(alpha: 0.35),
        highlightColor: AppColors.kWhite.withValues(alpha: 0.20),
        child: Container(
          width: 38,
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.kWhite.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 23,
            color: AppColors.kWhite,
          ),
        ),
      ),
    );
  }
}

