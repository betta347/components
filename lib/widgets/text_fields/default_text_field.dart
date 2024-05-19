import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final EdgeInsets contentPadding;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final double prefixMaxWidth;
  final double suffixMaxWidth;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool hasError;
  final bool isObscure;
  final String prefixText;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final String title;
  final double? height;
  final int? maxLines;
  final int? maxLength;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;
  final bool? expands;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool showCount;
  final TextInputAction? textInputAction;
  final Color errorColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color? fillColor;

  const DefaultTextField({
    this.autoFocus = false,
    this.showCount = false,
    this.focusNode,
    this.textInputAction,
    this.maxLengthEnforcement,
    required this.controller,
    required this.onChanged,
    this.prefix,
    this.title = '',
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.inputFormatters,
    this.suffix,
    this.fillColor,
    this.errorColor = Colors.red,
    this.focusedBorderColor = Colors.blue,
    this.enabledBorderColor = Colors.grey,
    this.prefixMaxWidth = 40,
    this.suffixMaxWidth = 40,
    this.hintStyle,
    this.hintText,
    this.style,
    this.isObscure = false,
    this.hasError = false,
    this.prefixText = '',
    this.inputDecoration,
    this.keyboardType,
    this.height,
    this.maxLines,
    this.maxLength,
    this.textAlignVertical,
    this.expands,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black)),
          const SizedBox(height: 8),
        ],
        SizedBox(
          height: height ?? 40,
          child: TextField(
            onTapOutside: (event) {
              focusNode?.unfocus();
            },
            expands: expands ?? false,
            maxLengthEnforcement: maxLengthEnforcement,
            textAlignVertical: textAlignVertical,
            focusNode: focusNode,
            autofocus: autoFocus,
            controller: controller,
            onChanged: onChanged,
            textInputAction: textInputAction,
            style: style ?? const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.blue),
            inputFormatters: inputFormatters,
            obscureText: isObscure,
            keyboardType: keyboardType,
            maxLength: maxLength,
            maxLines: isObscure ? 1 : maxLines,
            decoration: inputDecoration ??
                InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: hasError ? errorColor : enabledBorderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: hasError ? errorColor : focusedBorderColor),
                  ),
                  hintText: hintText,
                  hintStyle: hintStyle ??
                      const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                  contentPadding: contentPadding,
                  suffixIcon: suffix,
                  suffixIconConstraints: BoxConstraints(maxWidth: suffixMaxWidth),
                  fillColor: fillColor ?? Colors.white,
                  filled: true,
                  prefixIconConstraints: BoxConstraints(maxWidth: prefixMaxWidth),
                  prefixIcon: prefix,
                  counterText: '',
                ),
          ),
        ),
      ],
    );
  }
}
