import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class Paginator extends StatelessWidget {
  final FormzSubmissionStatus paginatorStatus;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final Widget errorWidget;
  final EdgeInsets? padding;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final Axis scrollDirection;
  final Widget? loadingWidget;
  final ScrollPhysics? physics;
  final bool? hasItems;

  const Paginator({
    required this.paginatorStatus,
    required this.itemBuilder,
    required this.itemCount,
    required this.fetchMoreFunction,
    required this.hasMoreToFetch,
    required this.errorWidget,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
    this.separatorBuilder,
    this.loadingWidget,
    this.physics,
    this.hasItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (paginatorStatus == FormzSubmissionStatus.inProgress) {
      return loadingWidget ?? const Center(child: CupertinoActivityIndicator());
    } else if (paginatorStatus == FormzSubmissionStatus.failure || (hasItems != null && hasItems!)) {
      return errorWidget;
    } else {
      return ListView.separated(
        scrollDirection: scrollDirection,
        physics: physics ?? const ScrollPhysics(),
        padding: padding,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == itemCount) {
            if (hasMoreToFetch) {
              fetchMoreFunction();
              return const Center(
                  child: CupertinoActivityIndicator(
                color: Colors.white,
              ));
            } else {
              return const SizedBox();
            }
          }
          return itemBuilder(context, index);
        },
        separatorBuilder: separatorBuilder ?? (context, index) => const SizedBox(),
        itemCount: itemCount + 1,
      );
    }
  }
}
