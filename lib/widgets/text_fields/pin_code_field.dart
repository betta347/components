import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinField extends StatelessWidget {
  final bool isError;
  final TextEditingController controller;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;
  final double? borderRadius;
  final double? fieldHeight;
  final double? fieldWidth;
  final Color disabledColor;
  final Color? cursorColor;
  final Color? selectedColor;
  final Color? selectedFillColor;
  final Color? activeFillColor;
  final Color? errorBorderColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? inactiveFillColor;
  final int length;
  final TextStyle? textStyle;

  const PinField({
    Key? key,
    this.onChanged,
    this.selectedColor,
    this.textStyle,
    this.activeColor,
    this.inactiveColor,
    this.inactiveFillColor,
    this.selectedFillColor,
    this.errorBorderColor,
    this.activeFillColor,
    this.fieldHeight,
    this.fieldWidth,
    this.borderRadius,
    this.cursorColor,
    this.autoFocus = false,
    this.isError = false,
    required this.controller,
    required this.disabledColor,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoFocus: autoFocus,
      cursorColor: cursorColor ?? Colors.black,
      controller: controller,
      keyboardType: TextInputType.number,
      appContext: context,
      length: length ?? 6,
      enableActiveFill: true,
      onChanged: onChanged ?? (v) {},
      pinTheme: PinTheme(
        fieldHeight: fieldHeight ?? 44,
        fieldWidth: fieldWidth ?? 43,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        disabledColor: disabledColor,
        shape: PinCodeFieldShape.box,
        activeColor: isError ? errorBorderColor : activeColor,
        activeFillColor: activeFillColor,
        selectedFillColor: selectedFillColor,
        selectedColor: selectedColor,
        errorBorderColor: errorBorderColor,
        inactiveFillColor: inactiveFillColor,
        inactiveColor: inactiveColor,
      ),
      textStyle: textStyle ??
          const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
    );
  }
}
