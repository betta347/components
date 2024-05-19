import 'package:flutter/material.dart';

class AppRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final double borderWidth;
  final Color backgroundColor;
  final double activeSize;
  final Color? centerColor;

  const AppRadio({
    required this.onChanged,
    required this.value,
    required this.groupValue,
    this.activeColor = Colors.grey,
    this.inactiveColor = Colors.white,
    this.borderWidth = 0.83,
    this.activeSize = 13,
    this.backgroundColor = Colors.transparent,
    this.centerColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onChanged(value);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: value == groupValue ? activeColor : inactiveColor,
                  width: borderWidth,
                ),
                shape: BoxShape.circle,
                color: backgroundColor,
              ),
              padding: value == groupValue ? const EdgeInsets.all(3) : EdgeInsets.zero,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: activeSize,
              width: activeSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: value == groupValue ? activeColor : centerColor ?? Colors.transparent,
              ),
            ),
          ],
        ),
      );
}
