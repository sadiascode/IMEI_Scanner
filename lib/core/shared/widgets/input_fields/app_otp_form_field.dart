import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/colors.dart';
import '../decoration/otp_input_field_decoration.dart';

class AppOtpFormField extends StatefulWidget {
  const AppOtpFormField({
    super.key,
    this.length = 4,
    this.validator,
    this.onCompleted,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.enabled = true,
  });

  final int length;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final AutovalidateMode autovalidateMode;
  final bool enabled;

  @override
  State<AppOtpFormField> createState() => _AppOtpFormFieldState();
}

class _AppOtpFormFieldState extends State<AppOtpFormField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _createFields();
  }

  void _createFields() {
    _controllers = List.generate(widget.length, (_) => TextEditingController());

    _focusNodes = List.generate(widget.length, (index) {
      final focusNode = FocusNode();

      focusNode.onKeyEvent = (node, event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.backspace) {
          _handleBackspace(index);
        }

        return KeyEventResult.ignored;
      };

      return focusNode;
    });
  }

  String get _value {
    return _controllers.map((controller) => controller.text).join();
  }

  int get _activeIndex {
    final firstEmptyIndex = _controllers.indexWhere(
      (controller) => controller.text.isEmpty,
    );

    return firstEmptyIndex == -1 ? widget.length - 1 : firstEmptyIndex;
  }

  void _focusActiveField() {
    final index = _activeIndex;

    _focusNodes[index].requestFocus();

    final controller = _controllers[index];
    controller.selection = TextSelection.collapsed(
      offset: controller.text.length,
    );
  }

  void _handleBackspace(int index) {
    if (index == 0) return;

    final currentController = _controllers[index];

    // If the current field still contains a digit, let TextField
    // remove it normally.
    if (currentController.text.isNotEmpty) {
      return;
    }

    // Current field is already empty, so remove the previous digit
    // and focus the previous field.
    final previousController = _controllers[index - 1];

    if (previousController.text.isNotEmpty) {
      previousController.clear();
    }

    _focusNodes[index - 1].requestFocus();

    final value = _value;
    widget.onChanged?.call(value);
  }

  void _handleChanged(int index, String digit, FormFieldState<String> field) {
    final value = _value;

    field.didChange(value);
    widget.onChanged?.call(value);

    if (digit.isNotEmpty) {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        widget.onCompleted?.call(value);
      }
    }

    // Do not move to the previous field here.
    // Backspace behavior is handled by _handleBackspace().
  }

  void _handleEditingComplete(int index) {
    final currentValue = _controllers[index].text;

    // Do not move focus when the current field is empty.
    if (currentValue.isEmpty) {
      _focusNodes[index].requestFocus();
      return;
    }

    if (index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else {
      _focusNodes[index].unfocus();
    }
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.length != widget.length) {
      return 'Enter the ${widget.length}-digit code';
    }

    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Code must contain digits only';
    }

    return null;
  }

  void _disposeFields() {
    for (final controller in _controllers) {
      controller.dispose();
    }

    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
  }

  @override
  void didUpdateWidget(covariant AppOtpFormField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.length != widget.length) {
      _disposeFields();
      _createFields();
    }
  }

  @override
  void dispose() {
    _disposeFields();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: '',
      validator: widget.validator ?? _defaultValidator,
      autovalidateMode: widget.autovalidateMode,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
              decoration: BoxDecoration(
                color: AppColors.kBlueLight.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(widget.length, (index) {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.17,
                    height: 75,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      enabled: widget.enabled,
                      onTap: _focusActiveField,
                      onEditingComplete: () {
                        _handleEditingComplete(index);
                      },
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.number,
                      textInputAction: index == widget.length - 1
                          ? TextInputAction.done
                          : TextInputAction.next,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      maxLength: 1,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: OTPInputFieldDecoration(
                        label: '',
                      ).build().copyWith(counterText: ''),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                      onChanged: (digit) {
                        _handleChanged(index, digit, field);
                      },
                    ),
                  );
                }),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 6),
                child: Text(
                  field.errorText!,
                  style: TextStyle(color: AppColors.kAccent, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
