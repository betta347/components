import 'package:components/widgets/other_widgets/stroke_paint.dart';
import 'package:components/widgets/text_fields/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordTextField extends StatefulWidget {
  final String prefixIcon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String title;
  final String hintText;
  final String suffixSvgIcon;
  final bool hasError;
  final Widget? suffix;
  final Widget? prefix;

  const PasswordTextField(
      {required this.controller,
      required this.onChanged,
      required this.suffixSvgIcon,
      this.hintText = '',
      this.suffix,
      this.prefix,
      this.title = '',
      this.hasError = false,
      this.prefixIcon = '',
      super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> with TickerProviderStateMixin {
  bool isObscure = true;
  late AnimationController animationController;
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    // animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      title: widget.title,
      controller: widget.controller,
      onChanged: widget.onChanged,
      isObscure: isObscure,
      hasError: widget.hasError,
      hintText: widget.hintText,
      maxLines: 1,
      suffix: widget.suffix ??
          GestureDetector(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
              if (isObscure) {
                animationController.reverse();
              } else {
                animationController.forward();
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(widget.suffixSvgIcon),
                ),
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) => SizedBox(
                    width: 24,
                    height: 24,
                    child: CustomPaint(
                      foregroundPainter: StrokePaint(animationController.value),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
      prefix: widget.prefix ??
          (widget.prefixIcon.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: SvgPicture.asset(widget.prefixIcon),
                )
              : null),
    );
  }
}
