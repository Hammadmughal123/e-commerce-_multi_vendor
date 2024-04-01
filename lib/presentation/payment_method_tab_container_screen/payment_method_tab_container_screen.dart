import 'controller/payment_method_tab_container_controller.dart';
import '../../core/app_export.dart';
import '../../presentation/payment_method_page/payment_method_page.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class PaymentMethodTabContainerScreen
    extends GetWidget<PaymentMethodTabContainerController> {
  const PaymentMethodTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 18.v),
                _buildTabview(),
                SizedBox(
                  height: 587.v,
                  child: TabBarView(
                    controller: controller.tabviewController,
                    children: [
                      PaymentMethodPage(),
                      PaymentMethodPage(),
                      PaymentMethodPage(),
                      PaymentMethodPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 69.h,
      leading: AppbarLeadingIconbuttonThree(
        imagePath: ImageConstant.imgClockBlueGray5001,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 5.v,
          bottom: 5.v,
        ),
      ),
      title: AppbarSubtitleOne(
        text: "lbl_payment".tr,
        margin: EdgeInsets.only(left: 18.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview() {
    return Container(
      height: 101.v,
      width: 351.h,
      child: TabBar(
        controller: controller.tabviewController,
        isScrollable: true,
        tabs: [
          Tab(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 66.v,
                    width: 85.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.h,
                      vertical: 23.v,
                    ),
                    decoration: AppDecoration.fillGray10001.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgSettingsPrimary,
                     
                      alignment: Alignment.bottomLeft,
                     // fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      "lbl_cash".tr,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Tab(
            child: Column(
              children: [
                Container(
                  height: 72.v,
                  width: 85.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.h,
                    vertical: 29.v,
                  ),
                  decoration: AppDecoration.fillGray10001.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgSettingsBlue800,
                    height: 13.v,
                    width: 40.h,
                    alignment: Alignment.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.v),
                  child: Text(
                    "lbl_visa".tr,
                  ),
                ),
              ],
            ),
          ),
          Tab(
            child: Column(
              children: [
                SizedBox(
                  height: 79.v,
                  width: 86.h,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup2429,
                        height: 72.v,
                        width: 85.h,
                        alignment: Alignment.bottomCenter,
                      ),
                      CustomIconButton(
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        padding: EdgeInsets.all(7.h),
                        decoration: IconButtonStyleHelper.outlineWhiteA,
                        alignment: Alignment.topRight,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgCheckmarkWhiteA700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.v),
                  child: Text(
                    "lbl_mastercard".tr,
                  ),
                ),
              ],
            ),
          ),
          Tab(
            child: Column(
              children: [
                Container(
                  height: 72.v,
                  width: 85.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.h,
                    vertical: 20.v,
                  ),
                  decoration: AppDecoration.fillGray10001.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgSettingsLime500,
                    height: 29.v,
                    width: 24.h,
                    alignment: Alignment.bottomLeft,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.v),
                  child: Text(
                    "lbl_paypal".tr,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
