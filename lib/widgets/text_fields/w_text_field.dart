import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WTextField extends StatelessWidget {
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
  final TextStyle? counterStyle;
  final TextStyle? prefixStyle;
  final String? hintText;
  final bool hasError;
  final bool isObscure;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final String title;
  final String prefixText;
  final String greyText;
  final double? height;
  final double? cursorHeight;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;
  final bool? expands;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool showCount;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color cursorColor;
  final Color focusColor;
  final Color enabledBorder;
  final bool readOnly;
  final String? Function(String?)? validator;
  final bool hasSuffixIcon;
  final String? counterText;
  final TextStyle? titleTextStyle;
  final Color errorColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color? hintColor;

  const WTextField({
    this.autoFocus = false,
    this.hasSuffixIcon = false,
    this.showCount = false,
    this.readOnly = false,
    this.focusNode,
    this.textInputAction,
    this.prefixStyle,
    this.hintColor,
    this.maxLengthEnforcement,
    this.titleTextStyle,
    this.validator,
    this.counterText = '',
    this.counterStyle,
    this.errorColor = Colors.red,
    this.focusedBorderColor = Colors.blue,
    this.enabledBorderColor = Colors.grey,
    required this.controller,
    required this.onChanged,
    this.prefix,
    this.title = '',
    this.prefixText = '',
    this.greyText = '',
    this.contentPadding = const EdgeInsets.all(12),
    this.inputFormatters,
    this.suffix,
    this.prefixMaxWidth = 40,
    this.suffixMaxWidth = 40,
    this.hintStyle,
    this.hintText,
    this.style,
    this.isObscure = false,
    this.hasError = false,
    this.inputDecoration,
    this.keyboardType,
    this.height,
    this.maxLines,
    this.maxLength,
    this.textAlignVertical,
    this.expands,
    this.cursorHeight,
    this.fillColor,
    this.cursorColor = Colors.black,
    this.focusColor = Colors.transparent,
    this.enabledBorder = Colors.white,
    this.minLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Text(title, style: titleTextStyle),
          const SizedBox(height: 8),
        ],
        SizedBox(
          height: height,
          child: TextFormField(
            readOnly: readOnly,
            expands: expands ?? false,
            maxLengthEnforcement: maxLengthEnforcement,
            textAlignVertical: textAlignVertical,
            focusNode: focusNode,
            autofocus: autoFocus,
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            textInputAction: textInputAction,
            style: style ?? Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400),
            inputFormatters: inputFormatters,
            obscureText: isObscure,
            keyboardType: keyboardType,
            maxLength: maxLength,
            maxLines: isObscure ? 1 : maxLines,
            minLines: minLines,
            cursorColor: cursorColor,
            cursorWidth: 1,
            cursorHeight: cursorHeight ?? 24,
            textCapitalization: TextCapitalization.sentences,
            decoration: inputDecoration ??
                InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: errorColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: enabledBorderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: focusedBorderColor),
                    ),
                    hintText: hintText,
                    hintStyle: hintStyle ?? Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintColor),
                    contentPadding: contentPadding,
                    suffixIconConstraints: BoxConstraints(maxWidth: suffixMaxWidth),
                    suffixIcon: hasSuffixIcon
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: suffix,
                          ),
                    fillColor: fillColor ?? Theme.of(context).secondaryHeaderColor,
                    filled: true,
                    prefixIconConstraints: BoxConstraints(maxWidth: prefixMaxWidth),
                    prefixIcon: prefix,
                    prefixText: prefixText,
                    prefixStyle:
                        prefixStyle ?? Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400),
                    counterText: counterText,
                    counterStyle: counterStyle ??
                        Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400)),
          ),
        ),
      ],
    );
  }
}
