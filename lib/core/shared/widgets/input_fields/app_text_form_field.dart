import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../decoration/input_field_decoration.dart';
import '../decoration/input_field_decorationx.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixText,
    this.suffixIcon,
    required this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.required = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.maxLength,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final String label;
  final String? prefixText;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  final bool enabled;
  final bool readOnly;
  final bool required;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      enabled: enabled,
      readOnly: readOnly,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      obscureText: obscureText,
      decoration: required
          ? InputFieldDecorationX(
              label: label,
              prefixText: prefixText,
              suffixIcon: suffixIcon,
            ).build().copyWith(counterText: '')
          : InputFieldDecoration(
              label: label,
              prefixText: prefixText,
              suffixIcon: suffixIcon,
            ).build().copyWith(counterText: ''),
      validator: validator,
    );
  }
}
