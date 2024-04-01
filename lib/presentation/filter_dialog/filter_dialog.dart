import '../filter_dialog/widgets/eightynine_item_widget.dart';
import '../filter_dialog/widgets/ninetyfour_item_widget.dart';
import '../filter_dialog/widgets/ninetyone_item_widget.dart';
import 'controller/filter_controller.dart';
import 'models/eightynine_item_model.dart';
import 'models/ninetyfour_item_model.dart';
import 'models/ninetyone_item_model.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class FilterDialog extends StatelessWidget {
  FilterDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  FilterController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 347.h,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 14.v,
                    bottom: 9.v,
                  ),
                  child: Text(
                    "msg_filter_your_search".tr,
                    style: CustomTextStyles.bodyLargeSenGray900Regular17,
                  ),
                ),
                CustomIconButton(
                  height: 45.adaptSize,
                  width: 45.adaptSize,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCloseBlueGray5001,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "lbl_offers".tr.toUpperCase(),
              style: CustomTextStyles.bodyMediumBluegray9000213,
            ),
          ),
          SizedBox(height: 13.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Obx(
              () => Wrap(
                runSpacing: 16.v,
                spacing: 16.h,
                children: List<Widget>.generate(
                  controller
                      .filterModelObj.value.ninetyfourItemList.value.length,
                  (index) {
                    NinetyfourItemModel model = controller
                        .filterModelObj.value.ninetyfourItemList.value[index];

                    return NinetyfourItemWidget(
                      model,
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 31.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "lbl_deliver_time".tr.toUpperCase(),
              style: CustomTextStyles.bodyMediumBluegray9000213,
            ),
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Obx(
              () => Wrap(
                runSpacing: 16.v,
                spacing: 16.h,
                children: List<Widget>.generate(
                  controller
                      .filterModelObj.value.ninetyoneItemList.value.length,
                  (index) {
                    NinetyoneItemModel model = controller
                        .filterModelObj.value.ninetyoneItemList.value[index];

                    return NinetyoneItemWidget(
                      model,
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 31.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "lbl_pricing".tr.toUpperCase(),
              style: CustomTextStyles.bodyMediumBluegray9000213,
            ),
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Obx(
              () => Wrap(
                runSpacing: 11.v,
                spacing: 11.h,
                children: List<Widget>.generate(
                  controller
                      .filterModelObj.value.eightynineItemList.value.length,
                  (index) {
                    EightynineItemModel model = controller
                        .filterModelObj.value.eightynineItemList.value[index];

                    return EightynineItemWidget(
                      model,
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 31.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "lbl_rating".tr.toUpperCase(),
              style: CustomTextStyles.bodyMediumBluegray9000213,
            ),
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(
              left: 4.h,
              right: 27.h,
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.h),
                  decoration: AppDecoration.outlineGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder24,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgStar118x18,
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                    radius: BorderRadius.circular(
                      1.h,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 11.h),
                  padding: EdgeInsets.all(12.h),
                  decoration: AppDecoration.outlineGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder24,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgStar18,
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                    radius: BorderRadius.circular(
                      1.h,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 11.h),
                  padding: EdgeInsets.all(12.h),
                  decoration: AppDecoration.outlineGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder24,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgStar19,
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                    radius: BorderRadius.circular(
                      1.h,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 11.h),
                  padding: EdgeInsets.all(12.h),
                  decoration: AppDecoration.outlineGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder24,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgStar110,
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                    radius: BorderRadius.circular(
                      1.h,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 11.h),
                  padding: EdgeInsets.all(12.h),
                  decoration: AppDecoration.outlineGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder24,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgStar111,
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                    radius: BorderRadius.circular(
                      1.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 31.v),
          CustomElevatedButton(
            text: "lbl_filter".tr.toUpperCase(),
            margin: EdgeInsets.symmetric(horizontal: 4.h),
            buttonTextStyle: theme.textTheme.titleMedium!,
          ),
        ],
      ),
    );
  }
}
