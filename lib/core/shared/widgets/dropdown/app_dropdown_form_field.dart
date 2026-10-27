import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../decoration/input_field_decoration.dart';
import '../decoration/input_field_decorationx.dart';

class AppDropdownFormField extends StatelessWidget {
  const AppDropdownFormField({
    super.key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
    this.enabled = true,
    this.required = false,
  });

  final String label;
  final Map<String, String> items;
  final String? value;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool required;

  @override
  Widget build(BuildContext context) {
    final validValue = items.containsKey(value) ? value : null;

    final fieldKey = ValueKey(
      '${validValue ?? ''}|${items.keys.join('\u0000')}',
    );

    return FormField<String>(
      key: fieldKey,
      initialValue: value,
      validator: validator,
      builder: (field) {
        final decoration = required
            ? InputFieldDecorationX(
                label: label,
              ).build().copyWith(errorText: field.errorText)
            : InputFieldDecoration(label: label).build();

        return InputDecorator(
          decoration: decoration,
          isEmpty: field.value == null || field.value!.isEmpty,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: field.value,
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
              onChanged: enabled
                  ? (newValue) {
                      field.didChange(newValue);
                      onChanged(newValue);
                    }
                  : null,
              items: items.entries.map((item) {
                return DropdownMenuItem<String>(
                  value: item.key,
                  child: Text(item.value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
