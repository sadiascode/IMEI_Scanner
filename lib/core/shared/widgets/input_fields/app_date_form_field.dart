import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../decoration/input_field_decoration.dart';
import '../decoration/input_field_decorationx.dart';

class AppDateFormField extends StatelessWidget {
  const AppDateFormField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.validator,
    this.enabled = true,
    this.required = false,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.helpText,
    this.dateFormat = _defaultDateFormat,
    this.suffixIcon = const Icon(Icons.calendar_month_rounded, size: 19),
  });

  final String label;
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;
  final String? Function(DateTime?) validator;

  final bool enabled;
  final bool required;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final String? helpText;
  final String Function(DateTime date) dateFormat;
  final Widget? suffixIcon;

  static String _defaultDateFormat(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  Future<void> _pickDate(
    BuildContext context,
    FormFieldState<DateTime> field,
  ) async {
    if (!enabled) return;

    final now = DateTime.now();

    final firstDateValue = firstDate ?? DateTime(1900);
    final lastDateValue = lastDate ?? DateTime(now.year + 100);

    DateTime selectedInitialDate = value ?? initialDate ?? DateTime.now();

    if (selectedInitialDate.isBefore(firstDateValue)) {
      selectedInitialDate = firstDateValue;
    } else if (selectedInitialDate.isAfter(lastDateValue)) {
      selectedInitialDate = lastDateValue;
    }

    final picked = await showDatePicker(
      context: context,
      initialDate: selectedInitialDate,
      firstDate: firstDateValue,
      lastDate: lastDateValue,
      helpText: helpText,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.kPrimary,
              primary: AppColors.kPrimary,
              secondary: AppColors.kAccent,
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );

    if (picked != null) {
      field.didChange(picked);
      onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      initialValue: value,
      validator: validator,
      builder: (field) {
        final decoration = required
            ? InputFieldDecorationX(
                label: label,
                suffixIcon: suffixIcon,
              ).build()
            : InputFieldDecoration(
                label: label,
                suffixIcon: suffixIcon,
              ).build();

        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: enabled ? () => _pickDate(context, field) : null,
          child: InputDecorator(
            decoration: decoration.copyWith(errorText: field.errorText),
            isEmpty: value == null,
            child: Text(
              value == null ? '' : dateFormat(value!),
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w700,
                color: enabled
                    ? AppColors.kBlack.withValues(alpha: 0.82)
                    : AppColors.kBlack.withValues(alpha: 0.45),
              ),
            ),
          ),
        );
      },
    );
  }
}
