import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WCheckBox extends StatelessWidget {
  final bool isChecked;
  final Color checkBoxColor;
  final Color uncheckColor;
  final Color uncheckBorderColor;
  final Color checkBorderColor;
  final Color checkIconColor;
  final double size;

  const WCheckBox({
    required this.isChecked,
    required this.uncheckColor,
    required this.uncheckBorderColor,
    required this.checkBorderColor,
    required this.checkIconColor,
    this.size = 20,
    this.checkBoxColor = Colors.blue,
    Key? key,
  }) : super(key: key);

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
