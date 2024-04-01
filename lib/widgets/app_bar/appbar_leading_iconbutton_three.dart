import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarLeadingIconbuttonThree extends StatelessWidget {
  AppbarLeadingIconbuttonThree({
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
          height: 45.adaptSize,
          width: 45.adaptSize,
          child: Stack(
            children: [
              CustomImageView(
                color: Colors.white,
                imagePath: ImageConstant.imgClockBlueGray5001,
              ),
              Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 16,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
