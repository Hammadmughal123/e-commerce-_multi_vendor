import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarLeadingIconbuttonTwo extends StatelessWidget {
  AppbarLeadingIconbuttonTwo({
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
          decoration: IconButtonStyleHelper.fillBlueGray,
          child: Padding(
            padding: const EdgeInsets.only(top:13,left: 13,right: 13,bottom: 13),
            child: CustomImageView(
             // fit: BoxFit.cover,
              imagePath: imagePath,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
