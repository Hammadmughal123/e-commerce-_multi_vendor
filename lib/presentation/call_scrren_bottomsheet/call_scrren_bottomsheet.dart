import 'controller/call_scrren_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CallScrrenBottomsheet extends StatelessWidget {
  CallScrrenBottomsheet(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  CallScrrenController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 51.h,
        vertical: 27.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgProfile01,
            height: 106.v,
            width: 161.h,
          ),
          SizedBox(height: 8.v),
          Text(
            "lbl_robert_fox".tr,
            style: CustomTextStyles.titleLargeGray900,
          ),
          SizedBox(height: 8.v),
          Text(
            "msg_connecting".tr,
            style: CustomTextStyles.bodyLargeSenGray50001,
          ),
          SizedBox(height: 26.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgContrast,
                height: 48.adaptSize,
                width: 48.adaptSize,
                margin: EdgeInsets.only(
                  top: 56.v,
                  bottom: 9.v,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgEndIcon,
                height: 114.v,
                width: 115.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 56.v,
                  bottom: 9.v,
                ),
                child: CustomIconButton(
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  padding: EdgeInsets.all(7.h),
                  decoration: IconButtonStyleHelper.fillBlueGray,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgGroup2752,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.v),
        ],
      ),
    );
  }
}
