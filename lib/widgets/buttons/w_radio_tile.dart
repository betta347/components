import 'package:flutter/material.dart';

class WRadioTile<T> extends StatelessWidget {
  final T value;
  final T selectedVal;
  final String title;
  final VoidCallback onTap;

  const WRadioTile({required this.title, required this.value, required this.onTap, Key? key, required this.selectedVal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 20),
        visualDensity: VisualDensity.compact,
        title: Text(title),
        trailing: Radio<T>(
          value: value,
          groupValue: selectedVal,
          onChanged: (value) {
            onTap();
          },
        ),
      ),
    );
  }
}
