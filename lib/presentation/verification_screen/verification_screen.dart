import 'controller/verification_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_pin_code_text_field.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends GetWidget<VerificationController> {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: theme.colorScheme.onPrimary,
            body: SizedBox(
                height: SizeUtils.height,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.topLeft, children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.h, vertical: 23.v),
                            decoration: AppDecoration.fillWhiteA.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder24),
                            child:
                                Column(mainAxisSize: MainAxisSize.min, children: [
                              _buildCodeSection(),
                              SizedBox(height: 7.v),
                              Obx(() => CustomPinCodeTextField(
                                  context: Get.context!,
                                  controller: controller.otpController.value,
                                  onChanged: (value) {})),
                              SizedBox(height: 30.v),
                              CustomElevatedButton(
                                  text: "lbl_verify".tr.toUpperCase()),
                              SizedBox(height: 30.v)
                            ])),
                      )),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 45.h, top: 117.v, right: 68.h),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(right: 31.h),
                                    child: Text("lbl_verification".tr,
                                        style: theme.textTheme.headlineLarge)),
                                SizedBox(height: 8.v),
                                Opacity(
                                    opacity: 0.9,
                                    child: Text("msg_we_have_sent_a_code".tr,
                                        style: CustomTextStyles
                                            .bodyLargeSenWhiteA700Regular_2)),
                                SizedBox(height: 3.v),
                                Padding(
                                    padding: EdgeInsets.only(right: 39.h),
                                    child: Text("msg_example_gmail_com".tr,
                                        style: theme.textTheme.titleMedium))
                              ]))),
                  //_buildAppBarSection()
                ]))));
  }

  /// Section Widget
  Widget _buildCodeSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: Text("lbl_code".tr.toUpperCase(),
              style: CustomTextStyles.bodyMediumBluegray9000213)),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(text: " "),
                  TextSpan(
                      text: "lbl_resend_in_50sec2".tr,
                      style: CustomTextStyles.titleSmallff31343d)
                ]),
                textAlign: TextAlign.left)),
        SizedBox(width: 51.h, child: Divider(color: appTheme.blueGray90002))
      ])
    ]);
  }

  /// Section Widget
  Widget _buildAppBarSection() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 50.v),
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgGroup34),
                    fit: BoxFit.cover)),
            child: CustomAppBar(
                height: 45.v,
                leadingWidth: double.maxFinite,
                leading: AppbarLeadingIconbutton(
                    imagePath: ImageConstant.imgArrowLeftGray70001,
                    margin: EdgeInsets.only(left: 24.h, right: 306.h),
                    onTap: () {
                      onTapArrowLeft();
                    }))));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
