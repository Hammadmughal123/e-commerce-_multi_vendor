import 'controller/message_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_two.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MessageScreen extends GetWidget<MessageController> {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 20.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 69.v,
                          width: 219.h,
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgCheckmark,
                                              height: 9.v,
                                              width: 7.h,
                                              margin: EdgeInsets.only(
                                                  top: 39.v, bottom: 21.v)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.h),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 4.h),
                                                        child: Text(
                                                            "lbl_8_10_pm".tr,
                                                            style: CustomTextStyles
                                                                .bodySmallGray500)),
                                                    SizedBox(height: 3.v),
                                                    Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    11.h,
                                                                vertical: 15.v),
                                                        decoration: AppDecoration
                                                            .fillPrimary
                                                            .copyWith(
                                                                borderRadius:
                                                                    BorderRadiusStyle
                                                                        .roundedBorder10),
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                  height: 3.v),
                                                              Text(
                                                                  "lbl_are_you_coming"
                                                                      .tr,
                                                                  style: CustomTextStyles
                                                                      .bodyMediumWhiteA700)
                                                            ]))
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.h,
                                                  top: 24.v,
                                                  bottom: 5.v),
                                              child: CustomIconButton(
                                                  height: 40.adaptSize,
                                                  width: 40.adaptSize,
                                                  decoration:
                                                      IconButtonStyleHelper
                                                          .fillDeepOrangeTL20,
                                                  child: CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imageNotFound)))
                                        ])),
                                CustomImageView(
                                    imagePath: ImageConstant.imgProfile01,
                                    height: 46.v,
                                    width: 70.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(bottom: 1.v))
                              ])),
                      SizedBox(height: 21.v),
                      Padding(
                          padding: EdgeInsets.only(right: 75.h),
                          child: Text("lbl_8_11_pm".tr,
                              style: CustomTextStyles.bodySmallGray500)),
                      SizedBox(height: 7.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 13.h, right: 75.h),
                              child: Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 5.v),
                                    child: _buildClock()),
                                Expanded(
                                    child: CustomElevatedButton(
                                        height: 51.v,
                                        text: "msg_hay_congratulation".tr,
                                        margin: EdgeInsets.only(left: 7.h),
                                        buttonStyle:
                                            CustomButtonStyles.fillGray,
                                        buttonTextStyle: CustomTextStyles
                                            .bodyMediumBluegray90002))
                              ]))),
                      SizedBox(height: 21.v),
                      SizedBox(
                          height: 69.v,
                          width: 271.h,
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                _buildChat03(),
                                CustomImageView(
                                    imagePath: ImageConstant.imgProfile01,
                                    height: 46.v,
                                    width: 70.h,
                                    alignment: Alignment.bottomRight)
                              ])),
                      SizedBox(height: 21.v),
                      Padding(
                          padding: EdgeInsets.only(right: 75.h),
                          child: Text("lbl_8_12_pm".tr,
                              style: CustomTextStyles.bodySmallGray500)),
                      SizedBox(height: 7.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 13.h, right: 75.h),
                              child: Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 5.v),
                                    child: _buildClock()),
                                Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 7.h),
                                        child: CustomTextFormField(
                                            controller: controller
                                                .messageFiveController,
                                            hintText: "msg_i_m_coming_just".tr,
                                            hintStyle: CustomTextStyles
                                                .bodyMediumBluegray90002,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 15.h,
                                                    vertical: 17.v))))
                              ]))),
                      SizedBox(height: 21.v),
                      SizedBox(
                          height: 69.v,
                          width: 212.h,
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgCheckmarkGray40001,
                                          height: 9.v,
                                          width: 7.h,
                                          margin: EdgeInsets.only(
                                              top: 39.v, bottom: 21.v)),
                                      _buildTime()
                                    ])),
                                CustomImageView(
                                    imagePath: ImageConstant.imgProfile01,
                                    height: 46.v,
                                    width: 70.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(bottom: 1.v))
                              ])),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildMessageSeven()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 69.h,
        leading: AppbarLeadingIconbuttonTwo(
            imagePath: ImageConstant.imgCloseGray900,
            margin: EdgeInsets.only(left: 24.h, top: 5.v, bottom: 5.v),
            onTap: () {
              onTapClose();
            }),
        title: AppbarSubtitleOne(
            text: "lbl_robert_fox".tr, margin: EdgeInsets.only(left: 16.h)));
  }

  /// Section Widget
  Widget _buildChat03() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 23.h),
                      child: Text("lbl_8_11_pm".tr,
                          style: CustomTextStyles.bodySmallGray500)),
                  SizedBox(height: 3.v),
                  Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgCheckmarkPrimary,
                        height: 9.v,
                        width: 7.h,
                        margin: EdgeInsets.symmetric(vertical: 21.v)),
                    Container(
                        margin: EdgeInsets.only(left: 8.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 15.v),
                        decoration: AppDecoration.fillPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 3.v),
                              Text("msg_hey_where_are_you".tr,
                                  style: CustomTextStyles.bodyMediumWhiteA700)
                            ])),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 10.h, top: 6.v, bottom: 5.v),
                        child: CustomIconButton(
                            height: 40.adaptSize,
                            width: 40.adaptSize,
                            decoration:
                                IconButtonStyleHelper.fillDeepOrangeTL20,
                            child: CustomImageView()))
                  ])
                ])));
  }

  /// Section Widget
  Widget _buildTime() {
    return Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_8_12_pm".tr, style: CustomTextStyles.bodySmallGray500),
          SizedBox(height: 3.v),
          Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: Row(children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 14.v),
                    decoration: AppDecoration.fillPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 4.v),
                          Text("lbl_hurry_up_man".tr,
                              style: CustomTextStyles.bodyMediumWhiteA700)
                        ])),
                Padding(
                    padding: EdgeInsets.only(left: 10.h, top: 6.v, bottom: 5.v),
                    child: CustomIconButton(
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        decoration: IconButtonStyleHelper.fillDeepOrangeTL20,
                        child: CustomImageView()))
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildMessageSeven() {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 30.v),
        child: CustomTextFormField(
            controller: controller.messageSevenController,
            hintText: "msg_write_somethings".tr,
            textInputAction: TextInputAction.done,
            prefix: Container(
                margin: EdgeInsets.fromLTRB(20.h, 22.v, 11.h, 21.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgUser,
                    height: 18.adaptSize,
                    width: 18.adaptSize)),
            prefixConstraints: BoxConstraints(maxHeight: 62.v),
            suffix: Container(
                padding: EdgeInsets.all(11.h),
                margin: EdgeInsets.fromLTRB(30.h, 8.v, 20.h, 8.v),
                decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    borderRadius: BorderRadius.circular(21.h)),
                child: CustomImageView(
                    imagePath: ImageConstant.imgSave,
                    height: 20.adaptSize,
                    width: 20.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 62.v),
            contentPadding: EdgeInsets.symmetric(vertical: 23.v)));
  }

  /// Common widget
  Widget _buildClock() {
    return SizedBox(
        height: 46.adaptSize,
        width: 46.adaptSize,
        child: Stack(alignment: Alignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgClockBlueGray30001,
              height: 40.adaptSize,
              width: 40.adaptSize,
              alignment: Alignment.bottomCenter),
          CustomImageView(
              imagePath: ImageConstant.imgManCopy,
              height: 46.adaptSize,
              width: 46.adaptSize,
              alignment: Alignment.center)
        ]));
  }

  /// Navigates to the previous screen.
  onTapClose() {
    Get.back();
  }
}
