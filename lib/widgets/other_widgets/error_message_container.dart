import 'package:components/blocs/show_pop_up/show_pop_up_bloc.dart';
import 'package:components/widgets/buttons/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorMessageContainer extends StatelessWidget {
  final String message;
  final bool isSuccess;
  final Color? shadowColor;
  final Color borderColor;
  final Widget closeChild;
  final Widget messageIconChild;
  final TextStyle? messageStyle;

  const ErrorMessageContainer({
    required this.message,
    required this.isSuccess,
    required this.closeChild,
    required this.messageIconChild,
    required this.borderColor,
    this.shadowColor,
    this.messageStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.black.withOpacity(0.08),
            offset: const Offset(0, 6),
            blurRadius: 14,
          )
        ],
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            child: messageIconChild,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: messageStyle ?? Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),
            ),
          ),
          WScaleAnimation(
            onTap: () {
              context.read<ShowPopUpBloc>().add(HidePopUp());
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: closeChild,
            ),
          )
        ],
      ),
    );
  }
}
