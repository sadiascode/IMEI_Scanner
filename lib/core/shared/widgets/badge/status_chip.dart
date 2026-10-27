import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final String label;
  final Color primary;
  final IconData icon;

  const StatusChip({
    super.key,
    required this.label,
    required this.primary,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: primary.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: primary),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: primary,
              fontWeight: FontWeight.w900,
              fontSize: 13.5,
              letterSpacing: -0.1,
            ),
          ),
        ],
      ),
    );
  }
}
