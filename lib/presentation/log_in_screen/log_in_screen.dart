import 'controller/log_in_controller.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../domain/facebookauth/facebook_auth_helper.dart';
import '../../domain/googleauth/google_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LogInScreen extends GetWidget<LogInController> {
  LogInScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
    // return SafeArea(
    //     child: Scaffold(
    //         resizeToAvoidBottomInset: false,
    //         backgroundColor: theme.colorScheme.onPrimary,
    //         body: SizedBox(
    //             width: SizeUtils.width,
    //             child: SingleChildScrollView(
    //                 padding: EdgeInsets.only(
    //                     bottom: MediaQuery.of(context).viewInsets.bottom),
    //                 child: Form(
    //                     key: _formKey,
    //                     child: SizedBox(
    //                         height: SizeUtils.height,
    //                         width: double.maxFinite,
    //                         child: Stack(
    //                             alignment: Alignment.bottomCenter,
    //                             children: [
    //                               _buildLoginSection(),
    //                               Align(
    //                                   alignment: Alignment.bottomCenter,
    //                                   child: Container(
    //                                       padding: EdgeInsets.symmetric(
    //                                           horizontal: 24.h, vertical: 40.v),
    //                                       decoration: AppDecoration.fillWhiteA
    //                                           .copyWith(
    //                                               borderRadius:
    //                                                   BorderRadiusStyle
    //                                                       .customBorderTL24),
    //                                       child: Column(
    //                                           mainAxisSize: MainAxisSize.min,
    //                                           children: [
    //                                             Align(
    //                                                 alignment:
    //                                                     Alignment.centerLeft,
    //                                                 child: Text(
    //                                                     "lbl_email"
    //                                                         .tr
    //                                                         .toUpperCase(),
    //                                                     style: CustomTextStyles
    //                                                         .bodyMediumBluegray9000213)),
    //                                             SizedBox(height: 8.v),
    //                                             CustomTextFormField(
    //                                                 controller: controller
    //                                                     .emailController,
    //                                                 hintText:
    //                                                     "msg_example_gmail_com"
    //                                                         .tr,
    //                                                 hintStyle: CustomTextStyles
    //                                                     .bodyMediumBluegray90001_1,
    //                                                 textInputType: TextInputType
    //                                                     .emailAddress,
    //                                                 validator: (value) {
    //                                                   if (value == null ||
    //                                                       (!isValidEmail(value,
    //                                                           isRequired:
    //                                                               true))) {
    //                                                     return "err_msg_please_enter_valid_email"
    //                                                         .tr;
    //                                                   }
    //                                                   return null;
    //                                                 },
    //                                                 contentPadding:
    //                                                     EdgeInsets.symmetric(
    //                                                         horizontal: 19.h,
    //                                                         vertical: 22.v)),
    //                                             SizedBox(height: 23.v),
    //                                             Align(
    //                                                 alignment:
    //                                                     Alignment.centerLeft,
    //                                                 child: Text(
    //                                                     "lbl_password"
    //                                                         .tr
    //                                                         .toUpperCase(),
    //                                                     style: CustomTextStyles
    //                                                         .bodyMediumBluegray9000213)),
    //                                             SizedBox(height: 8.v),
    //                                             Obx(() => CustomTextFormField(
    //                                                 controller: controller
    //                                                     .passwordController,
    //                                                 hintText:
    //                                                     "lbl_123456789".tr,
    //                                                 hintStyle: CustomTextStyles
    //                                                     .bodyMediumBluegray90001_1,
    //                                                 textInputAction:
    //                                                     TextInputAction.done,
    //                                                 textInputType: TextInputType
    //                                                     .visiblePassword,
    //                                                 suffix: InkWell(
    //                                                     onTap: () {
    //                                                       controller
    //                                                               .isShowPassword
    //                                                               .value =
    //                                                           !controller
    //                                                               .isShowPassword
    //                                                               .value;
    //                                                     },
    //                                                     child: controller
    //                                                             .isShowPassword
    //                                                             .value
    //                                                         ? Container(
    //                                                             margin:
    //                                                                 EdgeInsets.fromLTRB(
    //                                                                     30.h,
    //                                                                     21.v,
    //                                                                     17.h,
    //                                                                     21.v),
    //                                                             child: Icon(Icons
    //                                                                 .visibility_off))
    //                                                         : Container(
    //                                                             margin:
    //                                                                 EdgeInsets.fromLTRB(
    //                                                                     30.h,
    //                                                                     21.v,
    //                                                                     17.h,
    //                                                                     21.v),
    //                                                             child:
    //                                                                 Icon(Icons.visibility))),
    //                                                 suffixConstraints: BoxConstraints(maxHeight: 62.v),
    //                                                 validator: (value) {
    //                                                   if (value == null ||
    //                                                       (!isValidPassword(
    //                                                           value,
    //                                                           isRequired:
    //                                                               true))) {
    //                                                     return "err_msg_please_enter_valid_password"
    //                                                         .tr;
    //                                                   }
    //                                                   return null;
    //                                                 },
    //                                                 obscureText: controller.isShowPassword.value,
    //                                                 contentPadding: EdgeInsets.only(left: 19.h, top: 22.v, bottom: 22.v))),
    //                                             SizedBox(height: 24.v),
    //                                             _buildRememberMeSection(),
    //                                             SizedBox(height: 29.v),
    //                                             CustomElevatedButton(
    //                                                 onPressed: () {
    //                                                   controller
    //                                                       .loginWithFirebase();
    //                                                   //  Get.toNamed(AppRoutes.locationAccessScreen);
    //                                                 },
    //                                                 text: "lbl_log_in"
    //                                                     .tr
    //                                                     .toUpperCase()),
    //                                             SizedBox(height: 39.v),
    //                                             Padding(
    //                                                 padding:
    //                                                     EdgeInsets.symmetric(
    //                                                         horizontal: 20.h),
    //                                                 child: Row(
    //                                                     mainAxisAlignment:
    //                                                         MainAxisAlignment
    //                                                             .center,
    //                                                     children: [
    //                                                       Text(
    //                                                           "msg_don_t_have_an_account"
    //                                                               .tr,
    //                                                           style: CustomTextStyles
    //                                                               .bodyLargeSenBluegray600),
    //                                                       Padding(
    //                                                           padding: EdgeInsets
    //                                                               .only(
    //                                                                   left: 4.h,
    //                                                                   top: 2.v),
    //                                                           child:
    //                                                               GestureDetector(
    //                                                             onTap: () {
    //                                                               Get.toNamed(
    //                                                                   AppRoutes
    //                                                                       .signUpScreen);
    //                                                             },
    //                                                             child: Text(
    //                                                                 "lbl_sign_up"
    //                                                                     .tr
    //                                                                     .toUpperCase(),
    //                                                                 style: CustomTextStyles
    //                                                                     .titleSmallPrimary),
    //                                                           ))
    //                                                     ])),
    //                                             SizedBox(height: 29.v),
    //                                             Text("lbl_or".tr,
    //                                                 style: CustomTextStyles
    //                                                     .bodyLargeSenBluegray600),
    //                                             SizedBox(height: 14.v),
    //                                             Padding(
    //                                                 padding:
    //                                                     EdgeInsets.symmetric(
    //                                                         horizontal: 39.h),
    //                                                 child: Row(
    //                                                     mainAxisAlignment:
    //                                                         MainAxisAlignment
    //                                                             .center,
    //                                                     children: [
    //                                                       CustomIconButton(
    //                                                           height: 62
    //                                                               .adaptSize,
    //                                                           width: 62
    //                                                               .adaptSize,
    //                                                           padding:
    //                                                               EdgeInsets
    //                                                                   .all(
    //                                                                       22.h),
    //                                                           decoration:
    //                                                               IconButtonStyleHelper
    //                                                                   .fillErrorContainer,
    //                                                           onTap: () {
    //                                                             onTapBtnFacebook();
    //                                                           },
    //                                                           child:
    //                                                               CustomImageView(
    //                                                             imagePath:
    //                                                                 ImageConstant
    //                                                                     .imgFacebook,
    //                                                             color: Colors
    //                                                                 .white,
    //                                                           )),
    //                                                       Padding(
    //                                                           padding: EdgeInsets
    //                                                               .only(
    //                                                                   left:
    //                                                                       30.h),
    //                                                           child:
    //                                                               CustomIconButton(
    //                                                                   height: 62
    //                                                                       .adaptSize,
    //                                                                   width: 62
    //                                                                       .adaptSize,
    //                                                                   padding: EdgeInsets
    //                                                                       .all(20
    //                                                                           .h),
    //                                                                   decoration:
    //                                                                       IconButtonStyleHelper
    //                                                                           .fillOnError,
    //                                                                   child:
    //                                                                       CustomImageView(
    //                                                                     imagePath:
    //                                                                         ImageConstant.imgTrash,
    //                                                                     color: Colors
    //                                                                         .white,
    //                                                                   ))),
    //                                                       Spacer(),
    //                                                       CustomIconButton(
    //                                                           height: 62
    //                                                               .adaptSize,
    //                                                           width: 62
    //                                                               .adaptSize,
    //                                                           padding:
    //                                                               EdgeInsets
    //                                                                   .all(
    //                                                                       21.h),
    //                                                           decoration:
    //                                                               IconButtonStyleHelper
    //                                                                   .fillGray,
    //                                                           onTap: () {
    //                                                             controller
    //                                                                 .googleSignIn();
    //                                                             //onTapBtnGoogle();
    //                                                           },
    //                                                           child:
    //                                                               CustomImageView(
    //                                                             imagePath:
    //                                                                 ImageConstant
    //                                                                     .imgGoogle,
    //                                                             color: Colors
    //                                                                 .white,
    //                                                           ))
    //                                                     ])),
    //                                             SizedBox(height: 14.v)
    //                                           ])))
    //                             ])))))));
    SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.onPrimary,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                height: SizeUtils.height,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    _buildLoginSection(),
                    _buildFormSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              controller: controller.emailController,
              labeltext: "Email".tr,
              labelStyle: CustomTextStyles.bodyMediumBluegray90001_1,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              },
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 19.h, vertical: 22.v),
            ),
            SizedBox(height: 23.v),
            Obx(
              () => CustomTextFormField(
                controller: controller.passwordController,
                labeltext: "Password".tr,
                labelStyle: CustomTextStyles.bodyMediumBluegray90001_1,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                suffix: InkWell(
                  onTap: () {
                    controller.isShowPassword.value =
                        !controller.isShowPassword.value;
                  },
                  child: controller.isShowPassword.value
                      ? Container(
                          margin: EdgeInsets.fromLTRB(30.h, 21.v, 17.h, 21.v),
                          child: const Icon(Icons.visibility),
                        )
                      : Container(
                          margin: EdgeInsets.fromLTRB(30.h, 21.v, 17.h, 21.v),
                          child: const Icon(Icons.visibility_off),
                        ),
                ),
                suffixConstraints: BoxConstraints(maxHeight: 62.v),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "err_msg_please_enter_valid_password".tr;
                  }
                  return null;
                },
                obscureText: !controller.isShowPassword.value,
                contentPadding:
                    EdgeInsets.only(left: 19.h, top: 22.v, bottom: 22.v),
              ),
            ),
            SizedBox(height: 24.v),
            _buildRememberMeSection(),
            SizedBox(height: 29.v),
            CustomElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.loginWithFirebase();
                }
              },
              text: "lbl_log_in".tr.toUpperCase(),
            ),
            SizedBox(height: 39.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "msg_don_t_have_an_account".tr,
                    style: CustomTextStyles.bodyLargeSenBluegray600,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.h, top: 2.v),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.signUpScreen);
                      },
                      child: Text(
                        "lbl_sign_up".tr.toUpperCase(),
                        style: CustomTextStyles.titleSmallPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 29.v),
            Text(
              "lbl_or".tr,
              style: CustomTextStyles.bodyLargeSenBluegray600,
            ),
            SizedBox(height: 14.v),
            _buildSocialButtons(),
            SizedBox(height: 14.v),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 39.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 62.adaptSize,
            width: 62.adaptSize,
            padding: EdgeInsets.all(22.h),
            decoration: IconButtonStyleHelper.fillErrorContainer,
            onTap: () {
              // controller.onTapBtnFacebook();
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgFacebook,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.h),
            child: CustomIconButton(
              height: 62.adaptSize,
              width: 62.adaptSize,
              padding: EdgeInsets.all(20.h),
              decoration: IconButtonStyleHelper.fillOnError,
              onTap: () {
                // controller.onTapBtnGoogle();
              },
              child: CustomImageView(
                imagePath: ImageConstant.imgTrash,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          CustomIconButton(
            height: 62.adaptSize,
            width: 62.adaptSize,
            padding: EdgeInsets.all(21.h),
            decoration: IconButtonStyleHelper.fillGray,
            onTap: () {
              controller.googleSignIn();
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgGoogle,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginSection() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 100.v),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgGroup48),
                    fit: BoxFit.cover)),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                "lbl_log_in".tr,
                style: theme.textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 2.v),
              Opacity(
                  opacity: 0.85,
                  child: Text(
                    "msg_please_sign_in_to".tr,
                    style: CustomTextStyles.bodyLargeSenWhiteA700Regular_1,
                    textAlign: TextAlign.center,
                  )),
              SizedBox(height: 52.v)
            ])));
  }

  /// Section Widget
  Widget _buildRememberMeSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Obx(() => CustomCheckboxButton(
          text: "lbl_remember_me".tr,
          value: controller.rememberMe.value,
          padding: EdgeInsets.symmetric(vertical: 1.v),
          onChange: (value) {
            controller.rememberMe.value = value;
          })),
      Padding(
          padding: EdgeInsets.only(top: 2.v),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.forgotPasswordScreen);
            },
            child: Text("lbl_forgot_password".tr,
                style: CustomTextStyles.bodyMediumPrimary),
          ))
    ]);
  }

  onTapBtnFacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapBtnGoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }
}
