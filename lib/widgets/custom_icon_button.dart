import '../../core/app_export.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(22.h),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillErrorContainer => BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(31.h),
      );
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
        borderRadius: BorderRadius.circular(31.h),
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray90003,
        borderRadius: BorderRadius.circular(31.h),
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray5001,
        borderRadius: BorderRadius.circular(22.h),
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(23.h),
      );
  static BoxDecoration get fillYellow => BoxDecoration(
        color: appTheme.yellow900,
        borderRadius: BorderRadius.circular(15.h),
      );
  static BoxDecoration get fillDeepOrange => BoxDecoration(
        color: appTheme.deepOrange50,
        borderRadius: BorderRadius.circular(25.h),
      );
  static BoxDecoration get fillDeepOrangeTL20 => BoxDecoration(
        color: appTheme.deepOrange100,
        borderRadius: BorderRadius.circular(20.h),
      );
  static BoxDecoration get fillWhiteATL11 => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(11.h),
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(12.h),
        border: Border.all(
          color: appTheme.whiteA700,
          width: 2.h,
        ),
      );
  static BoxDecoration get outlineWhiteATL20 => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(20.h),
        border: Border.all(
          color: appTheme.whiteA700,
          width: 1.h,
        ),
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(20.h),
      );
}
