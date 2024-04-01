import '../item_detail_one_screen/widgets/chipviewsize_item_widget.dart';
import 'controller/item_detail_one_controller.dart';
import 'models/chipviewsize_item_model.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton_three.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_pin_code_text_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ItemDetailOneScreen extends GetWidget<ItemDetailOneController> {
  const ItemDetailOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildBackgroundImage(),
              SizedBox(height: 25.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5.v),
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_burger_bistro".tr,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgStar14,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize,
                                      radius: BorderRadius.circular(
                                        1.h,
                                      ),
                                    ),
                                    Text(
                                      "lbl_4_7".tr,
                                      style:
                                          CustomTextStyles.titleMediumGray900,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                        _buildChipViewSize(),
                        SizedBox(height: 19.v),
                        Text(
                          "lbl_ingridents".tr.toUpperCase(),
                          style: CustomTextStyles.bodyMediumBluegray9000113,
                        ),
                        SizedBox(height: 20.v),
                        Padding(
                          padding: EdgeInsets.only(right: 1.h),
                          child: Obx(
                            () => CustomPinCodeTextField(
                              context: Get.context!,
                              controller: controller.otpController.value,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        SizedBox(height: 4.v),
                        _buildSaltRow(),
                        SizedBox(height: 10.v),
                        Padding(
                          padding: EdgeInsets.only(right: 70.h),
                          child: Row(
                            children: [
                              CustomIconButton(
                                height: 50.adaptSize,
                                width: 50.adaptSize,
                                padding: EdgeInsets.all(11.h),
                                decoration:
                                    IconButtonStyleHelper.fillDeepOrange,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgGroup8221,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: CustomIconButton(
                                  height: 50.adaptSize,
                                  width: 50.adaptSize,
                                  padding: EdgeInsets.all(13.h),
                                  decoration:
                                      IconButtonStyleHelper.fillDeepOrange,
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgTicket,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: CustomIconButton(
                                  height: 50.adaptSize,
                                  width: 50.adaptSize,
                                  padding: EdgeInsets.all(13.h),
                                  decoration:
                                      IconButtonStyleHelper.fillDeepOrange,
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgGroup8219,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: CustomIconButton(
                                  height: 50.adaptSize,
                                  width: 50.adaptSize,
                                  padding: EdgeInsets.all(13.h),
                                  decoration:
                                      IconButtonStyleHelper.fillDeepOrange,
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgGroup8218,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.v),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            right: 73.h,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "lbl_ginger".tr,
                                style: theme.textTheme.labelLarge,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 24.h),
                                child: Text(
                                  "lbl_broccoli".tr,
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 21.h),
                                child: Text(
                                  "lbl_orange".tr,
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 24.h),
                                child: Text(
                                  "lbl_walnut".tr,
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBackgroundImage() {
    return SizedBox(
      height: 321.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImageBackround,
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
  Widget _buildChipViewSize() {
    return Obx(
      () => Wrap(
        runSpacing: 14.v,
        spacing: 14.h,
        children: List<Widget>.generate(
          controller
              .itemDetailOneModelObj.value.chipviewsizeItemList.value.length,
          (index) {
            ChipviewsizeItemModel model = controller
                .itemDetailOneModelObj.value.chipviewsizeItemList.value[index];

            return ChipviewsizeItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSaltRow() {
    return Padding(
      padding: EdgeInsets.only(
        left: 13.h,
        right: 1.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15.v),
            child: Text(
              "lbl_salt".tr,
              style: theme.textTheme.labelLarge,
            ),
          ),
          Spacer(
            flex: 49,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.v),
            child: Text(
              "lbl_chicken".tr,
              style: theme.textTheme.labelLarge,
            ),
          ),
          Container(
            width: 36.h,
            margin: EdgeInsets.only(left: 26.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "lbl_onion".tr,
                    style: CustomTextStyles.labelLargeff737782,
                  ),
                  TextSpan(
                    text: "lbl_alergy".tr,
                    style: CustomTextStyles.bodySmallPoppinsff737782,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(
            flex: 50,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.v),
            child: Text(
              "lbl_garlic".tr,
              style: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 26.h,
              bottom: 2.v,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "lbl_pappers".tr,
                    style: CustomTextStyles.labelLargeff737782,
                  ),
                  TextSpan(
                    text: "lbl_alergy".tr,
                    style: CustomTextStyles.bodySmallPoppinsff737782,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
