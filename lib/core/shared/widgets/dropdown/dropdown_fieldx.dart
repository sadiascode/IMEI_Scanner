import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../decoration/input_field_decorationx.dart';

class DropdownFieldX extends StatelessWidget {
  final String label;
  final String? value;
  final bool enabled;
  // final List<String> items;
  final Map<String, String> items;
  final ValueChanged<String?> onChanged;

  const DropdownFieldX({
    super.key,
    required this.label,
    this.value,
    this.enabled = true,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputFieldDecorationX(label: label).build(),
      isEmpty: value == null || value!.isEmpty,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          isDense: true,
          dropdownColor: AppColors.kWhite,
          borderRadius: BorderRadius.circular(12),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.kBlack.withValues(alpha: 0.65),
          ),
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.kBlack.withValues(alpha: 0.82),
          ),
          onChanged: enabled ? onChanged : null,
          items: items.entries.map((item) {
            return DropdownMenuItem<String>(
              value: item.key,
              child: Text(item.value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
