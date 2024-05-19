import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

class GridPaginator extends StatelessWidget {
  final FormzSubmissionStatus paginatorStatus;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final double mainAxisMaxExtend;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final int crossAxisCount;
  final Widget errorWidget;
  final EdgeInsets? padding;
  final Widget? emptyWidget;
  final Widget? loadingWidget;
  final SliverGridDelegateWithFixedCrossAxisCount? delegate;

  const GridPaginator({
    required this.paginatorStatus,
    required this.itemBuilder,
    required this.mainAxisMaxExtend,
    required this.itemCount,
    required this.fetchMoreFunction,
    required this.hasMoreToFetch,
    required this.errorWidget,
    this.delegate,
    this.padding = EdgeInsets.zero,
    this.emptyWidget,
    this.loadingWidget,
    super.key,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
  });

  @override
  Widget build(BuildContext context) {
    if (paginatorStatus == FormzSubmissionStatus.inProgress) {
      return loadingWidget ?? const Center(child: CupertinoActivityIndicator());
    } else if (paginatorStatus == FormzSubmissionStatus.failure) {
      return errorWidget;
    } else if (paginatorStatus == FormzSubmissionStatus.success) {
      return GridView.builder(
        gridDelegate: delegate ??
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: mainAxisSpacing,
                mainAxisExtent: mainAxisMaxExtend),
        physics: const BouncingScrollPhysics(),
        padding: padding,
        itemBuilder: (context, index) {
          if (itemCount == 0) {
            return emptyWidget ?? const SizedBox.shrink();
          }
          if (index == itemCount) {
            if (hasMoreToFetch) {
              fetchMoreFunction();
              return const Center(child: CupertinoActivityIndicator());
            } else {
              return const SizedBox();
            }
          }
          return itemBuilder(context, index);
        },
        itemCount: itemCount,
        shrinkWrap: true,
      );
    } else {
      return const SizedBox();
    }
  }
}
