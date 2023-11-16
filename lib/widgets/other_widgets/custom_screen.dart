import 'package:components/blocs/show_pop_up/show_pop_up_bloc.dart';
import 'package:components/widgets/other_widgets/error_message_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CustomScreen extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final Widget closeChild;
  final Widget messageIconChild;

  const CustomScreen({
    required this.child,
    Key? key,
    required this.closeChild,
    required this.messageIconChild,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowPopUpBloc, ShowPopUpState>(
      builder: (context, state) => Material(
        child: Stack(
          children: [
            Positioned.fill(child: KeyboardDismisser(child: child)),
            AnimatedPositioned(
              top: state.showPopUp
                  ? MediaQuery.of(context).padding.top + 12
                  : -(MediaQuery.of(context).padding.top + 12 + 56),
              left: 16,
              right: 16,
              duration: const Duration(milliseconds: 150),
              child: ErrorMessageContainer(
                message: state.message,
                isSuccess: state.isSuccess,
                closeChild: closeChild,
                messageIconChild: messageIconChild,
                borderColor: borderColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
