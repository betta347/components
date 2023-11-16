import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoAlertDialog extends StatelessWidget {
  final String title;
  final String? description;
  final String leftActionText;
  final String rightActionText;
  final bool hasRedText;
  final Function() rightAction;

  const CustomCupertinoAlertDialog(
      {Key? key,
      required this.title,
      this.description,
      required this.leftActionText,
      required this.rightActionText,
      required this.rightAction,
      this.hasRedText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
      ),
      content: description != null
          ? Text(description!, style: Theme.of(context).textTheme.headlineSmall!.copyWith(letterSpacing: -0.08))
          : null,
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(leftActionText, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.blue)),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        CupertinoDialogAction(
          onPressed: rightAction,
          child: Text(rightActionText,
              style:
                  Theme.of(context).textTheme.headlineMedium!.copyWith(color: hasRedText ? Colors.red : Colors.blue)),
        ),
      ],
    );
  }
}
