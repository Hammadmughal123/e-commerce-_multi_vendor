import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarLeadingIconbuttonOne extends StatelessWidget {
  AppbarLeadingIconbuttonOne({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 35.adaptSize,
          width: 35.adaptSize,
          decoration: IconButtonStyleHelper.fillBlueGray,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomImageView(
              color: Colors.black,
              imagePath: ImageConstant.imgMenu,
            ),
          ),
        ),
      ),
    );
  }
}
