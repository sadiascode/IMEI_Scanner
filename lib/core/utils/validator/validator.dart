class Validator {
  static String? requiredText(
    String? value,
    String label, {
    int minLength = 3,
  }) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) return '$label is required';
    if (text.length < minLength) return 'Please enter a valid $label';

    return null;
  }

  static String? optionalText(
    String? value,
    String label, {
    int minLength = 3,
  }) {
    final text = value?.trim() ?? '';

    if (text.isNotEmpty && text.length < minLength) {
      return 'Please enter a valid $label';
    }

    return null;
  }

  static String? requiredDate(DateTime? value, String fieldName) {
    if (value == null) {
      return 'Please select $fieldName';
    }

    return null;
  }

  static String? requiredSelection(String? value, String label) {
    if (value == null || value.isEmpty) {
      return 'Please select $label';
    }
    return null;
  }

  static String? postalCodeValidator(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) return 'Postal Code is required';

    if (!RegExp(r'^\d{4}$').hasMatch(text)) {
      return 'Postal Code must contain exactly 4 digits';
    }

    return null;
  }
}
