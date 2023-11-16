import 'package:flutter/material.dart';

class WFullBottomSheet extends StatelessWidget {
  final double height;
  final Color? dividerColor;

  const WFullBottomSheet({
    super.key,
    this.dividerColor,
    required this.child,
    required this.height,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 4,
            width: 69,
            decoration: BoxDecoration(
              color: dividerColor ?? Colors.grey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: SizedBox(
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: child,
                )),
          ),
        ],
      ),
    );
  }
}
