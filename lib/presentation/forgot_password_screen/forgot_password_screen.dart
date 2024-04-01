import 'controller/forgot_password_controller.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  //GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ForgotPasswordController forgotPasswordController =
      Get.put<ForgotPasswordController>(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.onPrimary,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              height: SizeUtils.height,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  _buildAppBar(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.h, vertical: 23.v),
                      decoration: AppDecoration.fillWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("lbl_email".tr.toUpperCase(),
                              style:
                                  CustomTextStyles.bodyMediumBluegray9000213),
                          SizedBox(height: 8.v),
                          CustomTextFormField(
                            controller:
                                forgotPasswordController.emailController,
                            hintText: "msg_example_gmail_com".tr,
                            hintStyle:
                                CustomTextStyles.bodyMediumBluegray90001_1,
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  (!isValidEmail(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_email".tr;
                              }
                              return null;
                            },
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 19.h, vertical: 22.v),
                          ),
                          // CustomTextFormField(
                          //     controller: forgotPasswordController
                          //         .emailController,
                          //     hintText: "msg_example_gmail_com".tr,
                          //     hintStyle: CustomTextStyles
                          //         .bodyMediumBluegray90001_1,
                          //     textInputAction: TextInputAction.done,
                          //     textInputType: TextInputType.emailAddress,
                          //     validator: (value) {
                          //       if (value == null ||
                          //           (!isValidEmail(value,
                          //               isRequired: true))) {
                          //         return "err_msg_please_enter_valid_email"
                          //             .tr;
                          //       }
                          //       return null;
                          //     },
                          //     contentPadding: EdgeInsets.symmetric(
                          //         horizontal: 19.h, vertical: 22.v)),
                          SizedBox(height: 30.v),
                          CustomElevatedButton(
                              onPressed: () {
                                print('..........................working');
                                // Get.toNamed(AppRoutes.verificationScreen);
                                controller.resetPassword(
                                    controller.emailController.text.toString());

                                // Get.toNamed(AppRoutes
                                //     .verificationScreen);
                                // print(
                                //     '..........................working2');
                              },
                              text: "lbl_send_code".tr.toUpperCase()),
                          SizedBox(height: 30.v)
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 42.h, top: 120.v, right: 42.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "lbl_forgot_password".tr,
                            style: theme.textTheme.headlineLarge,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 4.v),
                          Opacity(
                              opacity: 0.85,
                              child: Text(
                                "msg_please_sign_in_to".tr,
                                style: CustomTextStyles.bodyLargeSenOrange50a7,
                                textAlign: TextAlign.center,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppBar() {
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        ImageConstant.imgGroup48,
        height: Get.height,
        fit: BoxFit.cover,
      ),

      // child: CustomAppBar(
      //   height: 45.v,
      //   leadingWidth: double.maxFinite,
      //   leading: AppbarLeadingIconbutton(
      //     imagePath: ImageConstant.imgArrowLeftGray70001,
      //     margin: EdgeInsets.only(left: 24.h, right: 306.h),
      //     onTap: () {
      //       onTapArrowLeft();
      //     },
      //   ),
      // ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
