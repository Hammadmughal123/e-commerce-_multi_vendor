import 'controller/tracking_order_controller.dart';
import '../../core/app_export.dart';
import 'package:flutter/material.dart';

class TrackingOrderBottomsheet extends StatelessWidget {
  TrackingOrderBottomsheet(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  TrackingOrderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 7.v,
              width: 70.h,
              decoration: BoxDecoration(
                color: appTheme.gray300,
                borderRadius: BorderRadius.circular(
                  3.h,
                ),
              ),
            ),
          ),
          SizedBox(height: 28.v),
          Padding(
            padding: EdgeInsets.only(right: 72.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgRestuarantImage53x63,
                  height: 53.v,
                  width: 63.h,
                  margin: EdgeInsets.only(bottom: 44.v),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "msg_uttora_coffee_house".tr,
                          style: CustomTextStyles.bodyLargeSenGray900Regular18,
                        ),
                        SizedBox(height: 6.v),
                        Text(
                          "msg_orderd_at_06_sept".tr,
                          style: theme.textTheme.bodyMedium,
                        ),
                        SizedBox(height: 16.v),
                        Text(
                          "lbl_2x_burger".tr,
                          style: CustomTextStyles.bodyMediumBluegray600,
                        ),
                        SizedBox(height: 4.v),
                        Text(
                          "lbl_4x_sanwitch".tr,
                          style: CustomTextStyles.bodyMediumBluegray600,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 34.v),
          Padding(
            padding: EdgeInsets.only(right: 37.h),
            child: Row(
              children: [
                Container(
                  height: 156.v,
                  width: 17.h,
                  margin: EdgeInsets.only(
                    top: 95.v,
                    bottom: 2.v,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 55.v,
                          child: VerticalDivider(
                            width: 1.h,
                            thickness: 1.v,
                            color: theme.colorScheme.primary,
                            indent: 10.h,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 47.v,
                          child: VerticalDivider(
                            width: 1.h,
                            thickness: 1.v,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 53.v,
                          child: VerticalDivider(
                            width: 1.h,
                            thickness: 1.v,
                            endIndent: 6.h,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                          margin: EdgeInsets.only(bottom: 46.v),
                          padding: EdgeInsets.all(4.h),
                          decoration: AppDecoration.fillGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgGroup2760,
                            height: 6.adaptSize,
                            width: 6.adaptSize,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                          padding: EdgeInsets.all(4.h),
                          decoration: AppDecoration.fillGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgGroup2760,
                            height: 6.adaptSize,
                            width: 6.adaptSize,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 17.adaptSize,
                          width: 17.adaptSize,
                          padding: EdgeInsets.all(4.h),
                          decoration: AppDecoration.fillPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgGroup2760,
                            height: 6.adaptSize,
                            width: 6.adaptSize,
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                          margin: EdgeInsets.only(top: 46.v),
                          padding: EdgeInsets.all(2.h),
                          decoration: AppDecoration.fillPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgGroup2762,
                            height: 10.adaptSize,
                            width: 10.adaptSize,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "lbl_20_min".tr,
                            style:
                                CustomTextStyles.headlineLargeGray900ExtraBold,
                          ),
                        ),
                        SizedBox(height: 2.v),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "msg_estimated_delivery".tr.toUpperCase(),
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: 39.v),
                        Text(
                          "msg_your_order_has_been".tr,
                          style: CustomTextStyles.bodyMediumPrimary13,
                        ),
                        SizedBox(height: 33.v),
                        Text(
                          "msg_the_restaurant_is".tr,
                          style: CustomTextStyles.bodyMedium13,
                        ),
                        SizedBox(height: 30.v),
                        Text(
                          "msg_your_order_has_been2".tr,
                          style: CustomTextStyles.bodyMedium13,
                        ),
                        SizedBox(height: 30.v),
                        Text(
                          "msg_order_arriving_soon".tr,
                          style: CustomTextStyles.bodyMedium13,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 34.v),
        ],
      ),
    );
  }
}
