import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? iconHeight;
  final double? iconWidth;
  final BoxFit fit;
  final Color? color;
  final Widget? imageBuilder;
  final BorderRadius? borderRadius;
  final double ratio;
  final EdgeInsets? padding;
  final Widget placeHolder;
  final Widget errorWidget;
  final BoxBorder? border;
  final Gradient? gradient;

  const WImage({
    this.imageUrl = "",
    this.padding,
    this.width,
    this.height,
    this.iconHeight,
    this.iconWidth,
    this.fit = BoxFit.fill,
    this.color,
    this.borderRadius,
    this.imageBuilder,
    this.ratio = 16 / 9,
    required this.errorWidget,
    required this.placeHolder,
    this.border,
    this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          color: color,
          fit: fit,
          imageBuilder: (context, imageProvider) => AspectRatio(
                aspectRatio: ratio,
                child: imageBuilder ??
                    Container(
                      width: width,
                      height: height,
                      padding: padding,
                      foregroundDecoration: BoxDecoration(gradient: gradient),
                      decoration: BoxDecoration(
                          borderRadius: borderRadius ?? BorderRadius.circular(0), border: border, color: color),
                      child: Image(
                        image: imageProvider,
                        fit: fit,
                      ),
                    ),
              ),
          placeholder: (context, val) => placeHolder,
          // Container(
          //   decoration: BoxDecoration(borderRadius: borderRadius, color: Colors.white),
          //   child: Image.asset(AppImages.avatar, fit: BoxFit.cover),
          // ),
          errorWidget: (context, url, error) => errorWidget
          // ?? Image.asset(AppImages.avatar, fit: BoxFit.cover),
          ),
    );
  }
}
