import 'package:components/widgets/buttons/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;
  final Color fillColor;
  final FocusNode? focusNode;
  final double borderRadius;
  final GlobalKey<FormState>? stateKey;
  final bool hasBorder;
  final bool focus;
  final TextStyle? textStyle;
  final double height;
  final double? suffixIconConstraints;
  final String prefixSvgIcon;
  final String hintText;
  final Color? hintColor;
  final Color? focusedBorder;
  final Color borderColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? filled;
  final EdgeInsets? contentPadding;

  const SearchField({
    this.focusNode,
    this.prefixIcon,
    this.suffixIconConstraints,
    this.contentPadding,
    this.filled,
    this.hintColor,
    this.suffixIcon,
    this.focusedBorder,
    this.stateKey,
    required this.borderColor,
    required this.prefixSvgIcon,
    required this.controller,
    required this.onChanged,
    required this.hintText,
    this.onClear,
    this.borderRadius = 10,
    this.fillColor = Colors.white,
    Key? key,
    this.hasBorder = true,
    this.focus = false,
    this.textStyle,
    this.height = 40,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        autofocus: widget.focus,
        key: widget.stateKey,
        focusNode: widget.focusNode,
        controller: _controller,
        onChanged: widget.onChanged,
        style: widget.textStyle ??
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
        decoration: InputDecoration(
          contentPadding: widget.contentPadding ?? const EdgeInsets.fromLTRB(12, 0, 0, 0),
          fillColor: widget.fillColor,
          filled: widget.filled ?? true,
          suffixIconConstraints: BoxConstraints(maxWidth: widget.suffixIconConstraints ?? 40),
          prefixIcon: widget.prefixIcon ??
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 6, 10),
                child: Center(
                  child: SvgPicture.asset(widget.prefixSvgIcon),
                ),
              ),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: widget.hintColor ?? Colors.grey),
          prefixIconConstraints: const BoxConstraints(maxWidth: 40),
          suffixIcon: widget.suffixIcon ??
              (_controller.text.isNotEmpty
                  ? WScaleAnimation(
                      onTap: () {
                        _controller.clear();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.close, color: Colors.black),
                      ),
                    )
                  : null),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(color: widget.hasBorder ? widget.borderColor : Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(color: widget.focusedBorder ?? Colors.blue),
          ),
        ),
      ),
    );
  }
}
