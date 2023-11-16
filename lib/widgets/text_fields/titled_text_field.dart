import 'package:components/widgets/text_fields/default_text_field.dart';
import 'package:flutter/material.dart';

class TitledTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final Widget? suffix;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool isObsecure;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final Widget? prefix;
  final double? height;
  final TextStyle? textStyle;

  const TitledTextField({
    super.key,
    this.focusNode,
    this.textStyle,
    this.prefix,
    this.textInputType = TextInputType.text,
    this.autoFocus = false,
    this.onChanged,
    this.isObsecure = false,
    required this.title,
    required this.controller,
    required this.hintText,
    this.suffix,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyle ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
        ),
        const SizedBox(height: 8),
        DefaultTextField(
          keyboardType: textInputType,
          focusNode: focusNode,
          isObscure: isObsecure,
          controller: controller,
          onChanged: onChanged ?? (v) {},
          hintText: hintText,
          suffix: suffix,
          prefix: prefix,
          height: height,
        ),
      ],
    );
  }
}
