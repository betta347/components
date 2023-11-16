import 'package:components/widgets/buttons/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBackButton;
  final VoidCallback? onTapBack;
  final String? title;
  final Widget? child;
  final TextStyle? titleStyle;
  final List<Widget> extraActions;
  final Color? backgroundColor;
  final String? backgroundAsset;
  final double? bottomRadius;
  final String backButtonIcon;
  final double? topMargin;
  final bool hasUnderline;
  final double? height;
  final Color? underlineColor;
  final List<BoxShadow>? boxShadow;
  final bool hasCancel;

  ///Default is set true
  final bool centerTitle;

  const WAppBar({
    Key? key,
    this.bottomRadius,
    this.hasCancel = false,
    this.topMargin,
    this.underlineColor,
    this.hasUnderline = false,
    this.backButtonIcon = '',
    this.backgroundAsset,
    this.child,
    this.onTapBack,
    this.backgroundColor,
    this.hasBackButton = true,
    this.title,
    this.titleStyle,
    this.extraActions = const [],
    this.centerTitle = true,
    this.boxShadow,
    this.height,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height ?? 54);

  @override
  Widget build(BuildContext context) => Container(
        height: (height ?? 54) + MediaQuery.of(context).padding.top,
        padding: EdgeInsets.only(left: 0, top: (topMargin ?? 0) + MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  offset: const Offset(0, -4),
                  blurRadius: 12,
                  color: Colors.black.withOpacity(0.12),
                  blurStyle: BlurStyle.normal,
                ),
              ],
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomRadius ?? 0),
            bottomRight: Radius.circular(bottomRadius ?? 0),
          ),
          image: backgroundAsset != null && backgroundAsset!.isNotEmpty
              ? DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(backgroundAsset!),
                )
              : null,
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hasBackButton)
                  Align(
                    alignment: Alignment.center,
                    child: WScaleAnimation(
                      onTap: () => onTapBack != null ? onTapBack!() : Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child:
                            backButtonIcon.isNotEmpty ? SvgPicture.asset(backButtonIcon) : const Icon(Icons.arrow_back),
                      ),
                    ),
                  )
                else
                  const SizedBox(),
                if (hasCancel)
                  Align(
                    alignment: Alignment.center,
                    child: WScaleAnimation(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  )
                else
                  const SizedBox(),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.of(extraActions),
                  ),
                )
              ],
            ),
            if (child != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [child!],
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(title ?? '', style: titleStyle ?? Theme.of(context).textTheme.headlineMedium),
                    )
                  ],
                ),
              ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: hasUnderline
                  ? Container(
                      height: 1,
                      color: underlineColor ?? Colors.black.withOpacity(0.08),
                    )
                  : const SizedBox(),
            )
          ],
        ),
      );
}
