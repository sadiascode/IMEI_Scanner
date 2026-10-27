import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/shared/widgets/input_fields/app_text_form_field.dart';
import '../../../../../core/utils/validator/validator.dart';

class ImeiField extends StatelessWidget {
  const ImeiField({super.key, required this.controller, this.enabled = true});

  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      label: 'IMEI Number',
      readOnly: !enabled,
      enabled: enabled,
      required: true,
      maxLength: 15,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) =>
          Validator.requiredText(value, 'IMEI number', minLength: 15),
    );
  }
}
