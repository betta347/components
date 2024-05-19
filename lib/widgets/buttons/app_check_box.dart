import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  final bool isChecked;
  final Color checkBoxColor;
  final Color uncheckColor;
  final Color uncheckBorderColor;
  final Color checkBorderColor;
  final Color checkIconColor;
  final double size;

  const AppCheckBox({
    required this.isChecked,
    this.uncheckColor = Colors.white,
    this.uncheckBorderColor = Colors.grey,
    this.checkBorderColor = Colors.blue,
    this.checkIconColor = Colors.white,
    this.size = 20,
    this.checkBoxColor = Colors.blue,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isChecked ? checkBoxColor : uncheckColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: isChecked ? checkBorderColor : uncheckBorderColor, width: 2),
        ),
        child: Icon(
          CupertinoIcons.checkmark_alt,
          size: size - 4,
          color: isChecked ? checkIconColor : Colors.transparent,
        ),
      );
}
