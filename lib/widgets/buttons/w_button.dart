import 'package:components/widgets/buttons/w_scale_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final BoxBorder? border;
  final double borderRadius;
  final Widget? child;
  final Color disabledColor;
  final bool isDisabled;
  final bool isLoading;
  final double? scaleValue;
  final List<BoxShadow>? shadow;
  final Gradient? gradient;
  final Duration? duration;

  const WButton({
    required this.onTap,
    this.child,
    this.text = '',
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 10,
    this.disabledColor = Colors.grey,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
    this.duration,
    this.margin,
    this.padding,
    this.textStyle,
    this.border,
    this.scaleValue,
    this.shadow,
    this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      scaleValue: scaleValue ?? 0.98,
      onTap: () {
        if (!(isLoading || isDisabled)) {
          onTap();
        }
      },
      isDisabled: isDisabled,
      child: AnimatedContainer(
        duration: duration ?? const Duration(milliseconds: 200),
        width: width,
        height: height ?? 44,
        margin: margin,
        padding: padding ?? EdgeInsets.zero,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisabled ? disabledColor : color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          gradient: gradient,
          boxShadow: shadow,
        ),
        child: isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                    fontWeight: isDisabled ? FontWeight.w700 : FontWeight.w600,
                    height: 1.36,
                    color: textColor),
                child: child ??
                    Text(
                      text,
                      style: textStyle,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
              ),
      ),
    );
  }
}
