import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../text/section_title.dart';
import 'radio_tile.dart';

enum RadioGroupDirection { row, column }

class AppRadioGroupFormField extends StatelessWidget {
  const AppRadioGroupFormField({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
    this.direction = RadioGroupDirection.column,
    this.spacing = 8,
    this.runSpacing = 10,
    this.validator,
  });

  final String label;
  final String? value;
  final List<RadioOption> options;
  final ValueChanged<String?> onChanged;
  final RadioGroupDirection direction;
  final double spacing;
  final double runSpacing;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: value,
      validator: validator,
      builder: (field) {
        final radioTiles = options.map((option) {
          return RadioTile(
            title: option.title,
            value: option.value,
            groupValue: field.value,
            onChanged: (newValue) {
              field.didChange(newValue);
              onChanged(newValue);
            },
          );
        }).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionTitle(title: label, isRequired: true),
            const SizedBox(height: 7),

            if (direction == RadioGroupDirection.row)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int index = 0; index < radioTiles.length; index++) ...[
                    Expanded(child: radioTiles[index]),
                    if (index < radioTiles.length - 1) SizedBox(width: spacing),
                  ],
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int index = 0; index < radioTiles.length; index++) ...[
                    radioTiles[index],
                    if (index < radioTiles.length - 1)
                      SizedBox(height: runSpacing),
                  ],
                ],
              ),

            if (field.errorText != null)
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  field.errorText!,
                  style: const TextStyle(
                    color: AppColors.kAccent,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class RadioOption {
  const RadioOption({required this.title, required this.value});

  final String title;
  final String value;
}
