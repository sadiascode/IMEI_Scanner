import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/colors.dart';
import '../decoration/otp_input_field_decoration.dart';

class OtpInputField extends StatefulWidget {
  const OtpInputField({
    super.key,
    this.length = 4,
    this.validator,
    this.onCompleted,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  final int length;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final AutovalidateMode autovalidateMode;

  @override
  State<OtpInputField> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInputField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _createFields();
  }

  void _createFields() {
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  int get _activeIndex {
    final firstEmpty = _controllers.indexWhere(
      (controller) => controller.text.isEmpty,
    );

    return firstEmpty == -1 ? widget.length - 1 : firstEmpty;
  }

  void _focusActiveField() {
    final index = _activeIndex;
    _focusNodes[index].requestFocus();

    final controller = _controllers[index];
    controller.selection = TextSelection.collapsed(
      offset: controller.text.length,
    );
  }

  @override
  void didUpdateWidget(covariant OtpInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.length != widget.length) {
      _disposeFields();
      _createFields();
    }
  }

  void _disposeFields() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
  }

  @override
  void dispose() {
    _disposeFields();
    super.dispose();
  }

  String get _value => _controllers.map((controller) => controller.text).join();

  String? _defaultValidator(String? value) {
    if (value == null || value.length != widget.length) {
      return 'Enter the ${widget.length}-digit code';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Code must contain digits only';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator ?? _defaultValidator,
      autovalidateMode: widget.autovalidateMode,
      initialValue: '',
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
                      onTap: _focusActiveField,
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.number,
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
                        } else if (index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
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
