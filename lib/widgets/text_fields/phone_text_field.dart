import 'package:components/widgets/text_fields/masked_text_field.dart';
import 'package:flutter/material.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool hasError;
  final String hintText;
  final String title;
  final String errorText;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final ValueChanged<String>? onChanged;
  final TextStyle? titleTextStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color errorColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color? fillColor;
  final Color? prefixColor;
  final double? height;
  final double? prefixIconConstraints;

  const PhoneTextField(
      {required this.controller,
      this.hasError = false,
      this.title = '',
      this.hintText = '__ ___ __ __',
      this.errorText = '',
      this.prefixIcon,
      this.fillColor,
      this.height,
      this.hintStyle,
      this.prefixIconConstraints,
      this.errorColor = Colors.red,
      this.focusedBorderColor = Colors.blue,
      this.enabledBorderColor = Colors.grey,
      this.textStyle,
      this.prefixColor,
      this.titleTextStyle,
      this.prefixIconColor,
      this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Text(title,
              style: titleTextStyle ??
                  const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  )),
          const SizedBox(height: 8),
        ],
        SizedBox(
          height: height ?? 40,
          child: WMaskedTextField(
            controller: controller,
            onChange: onChanged,
            mask: '## ### ## ##',
            keyboardType: TextInputType.number,
            style: textStyle ?? const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: hasError ? errorColor : enabledBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: hasError ? errorColor : focusedBorderColor,
                ),
              ),
              hintText: hintText,
              hintStyle: hintStyle ?? Theme.of(context).textTheme.headline3,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              fillColor: fillColor,
              filled: true,
              prefixIconConstraints: BoxConstraints(maxWidth: prefixIconConstraints ?? 51),
              prefixIcon: prefixIcon ??
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1.5, left: 12),
                        child: Text(
                          '+998',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: prefixColor ?? Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
