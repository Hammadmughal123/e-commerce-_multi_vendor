import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarLeadingIconbutton extends StatelessWidget {
  AppbarLeadingIconbutton({
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
          child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: CustomImageView(
              
              color: Colors.black,
              
              imagePath: ImageConstant.imgArrowLeftGray70001,
            ),
          ),
        ),
      ),
    );
  }
}
