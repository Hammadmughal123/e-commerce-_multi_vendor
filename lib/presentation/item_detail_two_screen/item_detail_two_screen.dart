import '../item_detail_two_screen/widgets/quality_item_widget.dart';
import 'controller/item_detail_two_controller.dart';
import 'models/quality_item_model.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton_three.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ItemDetailTwoScreen extends GetWidget<ItemDetailTwoController> {
  const ItemDetailTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildImageBackground(),
              SizedBox(height: 25.v),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildItemDetailTwo(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildImageBackground() {
    return SizedBox(
      height: 321.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImageBackround321x375,
            height: 321.v,
            width: 375.h,
            radius: BorderRadius.circular(
              30.h,
            ),
            alignment: Alignment.center,
          ),
          CustomAppBar(
            height: 95.v,
            leadingWidth: 69.h,
            leading: AppbarLeadingIconbuttonThree(
              imagePath: ImageConstant.imgClockWhiteA700,
              margin: EdgeInsets.only(left: 24.h),
            ),
            actions: [
              AppbarTrailingIconbuttonThree(
                imagePath: ImageConstant.imgFavorite,
                margin: EdgeInsets.symmetric(horizontal: 24.h),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildItemDetailTwo() {
    return Container(
      margin: EdgeInsets.only(bottom: 5.v),
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_electric_chip".tr,
            style: CustomTextStyles.titleLargeGray900,
          ),
          SizedBox(height: 4.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgEllipse1295,
                height: 22.adaptSize,
                width: 22.adaptSize,
                radius: BorderRadius.circular(
                  11.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 11.h,
                  top: 2.v,
                  bottom: 2.v,
                ),
                child: Text(
                  "lbl_rose_garden2".tr,
                  style: CustomTextStyles.bodyMediumGray900,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.v),
          Padding(
            padding: EdgeInsets.only(right: 64.h),
            child: Row(
              children: [
                SizedBox(
                  width: 53.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgStar15,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        radius: BorderRadius.circular(
                          1.h,
                        ),
                      ),
                      Text(
                        "lbl_4_7".tr,
                        style: CustomTextStyles.titleMediumGray900,
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 50,
                ),
                SizedBox(
                  width: 63.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgTelevision,
                        height: 16.v,
                        width: 23.h,
                      ),
                      Text(
                        "lbl_free".tr,
                        style: CustomTextStyles.bodyMediumGray900,
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 50,
                ),
                SizedBox(
                  width: 73.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgClock,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                      Text(
                        "lbl_20_min".tr,
                        style: CustomTextStyles.bodyMediumGray900,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22.v),
          Container(
            width: 310.h,
            margin: EdgeInsets.only(right: 16.h),
            child: Text(
              "msg_maecenas_sed_diam".tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium!.copyWith(
                height: 1.71,
              ),
            ),
          ),
          SizedBox(height: 16.v),
          Obx(
            () => Wrap(
              runSpacing: 17.99.v,
              spacing: 17.99.h,
              children: List<Widget>.generate(
                controller
                    .itemDetailTwoModelObj.value.qualityItemList.value.length,
                (index) {
                  QualityItemModel model = controller
                      .itemDetailTwoModelObj.value.qualityItemList.value[index];

                  return QualityItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
