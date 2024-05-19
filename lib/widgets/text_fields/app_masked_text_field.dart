import 'package:components/widgets/other_widgets/formatters.dart';
import 'package:flutter/material.dart';

class AppMaskedTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextStyle? style;
  final String mask;
  final String escapeCharacter;
  final int maxLength;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final InputDecoration decoration;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChange;
  final VoidCallback? onEditingComplete;
  final bool? autoFocus;

  const AppMaskedTextField({
    this.autoFocus,
    required this.controller,
    this.style,
    this.mask = 'xxx xxx xxx xxx xx',
    this.escapeCharacter = 'x',
    this.maxLength = 100,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.decoration = const InputDecoration(),
    this.focusNode,
    this.onChange,
    this.onEditingComplete,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _AppMaskedTextFieldState();
}

class _AppMaskedTextFieldState extends State<AppMaskedTextField> {
  int lastTextSize = 0;

  @override
  Widget build(BuildContext context) => TextField(
        autofocus: widget.autoFocus ?? false,
        controller: widget.controller,
        style: widget.style,
        inputFormatters: [Formatters.phoneFormatter],
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        decoration: widget.decoration,
        focusNode: widget.focusNode,
        onEditingComplete: widget.onEditingComplete,
        onChanged: (text) {
          if (text.length < lastTextSize) {
            if (widget.mask[text.length] != widget.escapeCharacter) {
              widget.controller.selection =
                  TextSelection.fromPosition(TextPosition(offset: widget.controller.text.length));
            }
          } else {
            // its typing
            if (text.length >= lastTextSize) {
              final position = text.length;

              if ((widget.mask[position - 1] != widget.escapeCharacter) &&
                  (text[position - 1] != widget.mask[position - 1])) {
                widget.controller.text = _buildText(text);
              }

              if (widget.maxLength != position && widget.mask[position] != widget.escapeCharacter) {
                widget.controller.text = '${widget.controller.text}${widget.mask[position]}';
              }
            }
            if (widget.controller.selection.start < widget.controller.text.length) {
              widget.controller.selection =
                  TextSelection.fromPosition(TextPosition(offset: widget.controller.text.length));
            }
          }

          lastTextSize = widget.controller.text.length;

          if (widget.onChange != null) {
            widget.onChange!(widget.controller.text);
          }
        },
      );

  String _buildText(String text) {
    final buffer = StringBuffer();

    for (var i = 0; i < text.length - 1; i++) {
      buffer.write(text[i]);
    }
    buffer
      ..write(widget.mask[text.length - 1])
      ..write(text[text.length - 1]);

    return buffer.toString(); // result;
  }
}