// import 'package:abu_s_application7/presentation/location_access_screen/location_access_screen.dart';

// import 'controller/sign_up_controller.dart';
// import '../../core/app_export.dart';
// import '../../core/utils/validation_functions.dart';
// import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
// import '../../widgets/app_bar/custom_app_bar.dart';
// import '../../widgets/custom_elevated_button.dart';
// import '../../widgets/custom_text_form_field.dart';
// import 'package:flutter/material.dart';

// // ignore_for_file: must_be_immutable
// class SignUpScreen extends GetWidget<SignUpController> {
//   SignUpScreen({Key? key}) : super(key: key);

//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             backgroundColor: theme.colorScheme.onPrimary,
//             body: SizedBox(
//                 width: SizeUtils.width,
//                 child: SingleChildScrollView(
//                     padding: EdgeInsets.only(
//                         bottom: MediaQuery.of(context).viewInsets.bottom),
//                     child: Form(
//                         key: _formKey,
//                         child: SizedBox(
//                             height: SizeUtils.height,
//                             width: double.maxFinite,
//                             child: Stack(
//                                 alignment: Alignment.topCenter,
//                                 children: [
//                                   Align(
//                                       alignment: Alignment.bottomCenter,
//                                       child: Container(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 24.h, vertical: 23.v),
//                                           decoration: AppDecoration.fillWhiteA
//                                               .copyWith(
//                                                   borderRadius:
//                                                       BorderRadiusStyle
//                                                           .customBorderTL24),
//                                           child: Column(
//                                               mainAxisSize: MainAxisSize.min,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                     "lbl_name".tr.toUpperCase(),
//                                                     style: CustomTextStyles
//                                                         .bodyMediumBluegray9000213),
//                                                 SizedBox(height: 8.v),
//                                                 _buildNameField(),
//                                                 SizedBox(height: 23.v),
//                                                 Text(
//                                                     "lbl_email"
//                                                         .tr
//                                                         .toUpperCase(),
//                                                     style: CustomTextStyles
//                                                         .bodyMediumBluegray9000213),
//                                                 SizedBox(height: 8.v),
//                                                 _buildEmailField(),
//                                                 SizedBox(height: 23.v),
//                                                 Text(
//                                                     "lbl_password"
//                                                         .tr
//                                                         .toUpperCase(),
//                                                     style: CustomTextStyles
//                                                         .bodyMediumBluegray9000213),
//                                                 SizedBox(height: 8.v),
//                                                 _buildPasswordField(),
//                                                 SizedBox(height: 23.v),
//                                                 Text(
//                                                     "msg_re_type_password"
//                                                         .tr
//                                                         .toUpperCase(),
//                                                     style: CustomTextStyles
//                                                         .bodyMediumBluegray9000213),
//                                                 SizedBox(height: 8.v),
//                                                 _buildRetypePasswordField(),
//                                                 SizedBox(height: 47.v),
//                                                 Center(
//                                                   child: TextButton(
//                                                     style: ButtonStyle(
//                                                       alignment: Alignment.center,
//                                                       backgroundColor: MaterialStatePropertyAll(Colors.amber),
//                                                       minimumSize: MaterialStatePropertyAll(Size(100, 50))
//                                                     ),
//                                                       onPressed: () {
//                                                         controller.userRegisterInFirebase();
//                                                       },
//                                                       child: Text(
//                                                         'Sign up',
//                                                         style: TextStyle(
//                                                             color: Colors.white),
//                                                       )),
//                                                 ),
//                                                 // _buildSignUpButton(),
//                                                 SizedBox(height: 6.v)
//                                               ]))),
//                                   Align(
//                                       alignment: Alignment.topCenter,
//                                       child: Padding(
//                                           padding: EdgeInsets.only(
//                                               left: 78.h,
//                                               top: 120.v,
//                                               right: 78.h),
//                                           child: Column(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 GestureDetector(
//                                                   onTap: () {},
//                                                   child: Text("lbl_sign_up".tr,
//                                                       style: theme.textTheme
//                                                           .headlineLarge),
//                                                 ),
//                                                 SizedBox(height: 4.v),
//                                                 Opacity(
//                                                     opacity: 0.85,
//                                                     child: Text(
//                                                         "msg_please_sign_up_to"
//                                                             .tr,
//                                                         style: CustomTextStyles
//                                                             .bodyLargeSenWhiteA700Regular_1))
//                                               ]))),
//                                   _buildAppBar()
//                                 ])))))));
//   }

//   /// Section Widget
//   Widget _buildNameField() {
//     return CustomTextFormField(
//         controller: controller.nameFieldController,
//         hintText: "lbl_john_doe".tr,
//         hintStyle: theme.textTheme.bodyMedium!,
//         contentPadding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 22.v));
//   }

//   /// Section Widget
//   Widget _buildEmailField() {
//     return CustomTextFormField(
//         controller: controller.emailFieldController,
//         hintText: "msg_example_gmail_com".tr,
//         hintStyle: theme.textTheme.bodyMedium!,
//         textInputType: TextInputType.emailAddress,
//         validator: (value) {
//           if (value == null || (!isValidEmail(value, isRequired: true))) {
//             return "err_msg_please_enter_valid_email".tr;
//           }
//           return null;
//         },
//         contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 22.v));
//   }

//   /// Section Widget
//   Widget _buildPasswordField() {
//     return Obx(() => CustomTextFormField(
//         controller: controller.passwordFieldController,
//         hintText: "lbl".tr,
//         hintStyle: CustomTextStyles.titleSmallBluegray30002,
//         textInputType: TextInputType.visiblePassword,
//         suffix: InkWell(
//             onTap: () {
//               controller.isShowPassword.value =
//                   !controller.isShowPassword.value;
//             },
//             child: Container(
//                 margin: EdgeInsets.fromLTRB(30.h, 24.v, 20.h, 24.v),
//                 child: CustomImageView(
//                     imagePath: ImageConstant.imgEyeBlueGray30002,
//                     height: 14.adaptSize,
//                     width: 14.adaptSize))),
//         suffixConstraints: BoxConstraints(maxHeight: 62.v),
//         validator: (value) {
//           if (value == null || (!isValidPassword(value, isRequired: true))) {
//             return "err_msg_please_enter_valid_password".tr;
//           }
//           return null;
//         },
//         obscureText: controller.isShowPassword.value,
//         contentPadding: EdgeInsets.only(left: 20.h, top: 22.v, bottom: 22.v)));
//   }

//   /// Section Widget
//   Widget _buildRetypePasswordField() {
//     return Obx(() => CustomTextFormField(
//         controller: controller.retypePasswordFieldController,
//         hintText: "lbl".tr,
//         hintStyle: CustomTextStyles.titleSmallBluegray30002,
//         textInputAction: TextInputAction.done,
//         textInputType: TextInputType.visiblePassword,
//         suffix: InkWell(
//             onTap: () {
//               controller.isShowPassword1.value =
//                   !controller.isShowPassword1.value;
//             },
//             child: Container(
//                 margin: EdgeInsets.fromLTRB(30.h, 24.v, 20.h, 24.v),
//                 child: CustomImageView(
//                     imagePath: ImageConstant.imgEyeBlueGray30002,
//                     height: 14.adaptSize,
//                     width: 14.adaptSize))),
//         suffixConstraints: BoxConstraints(maxHeight: 62.v),
//         validator: (value) {
//           if (value == null || (!isValidPassword(value, isRequired: true))) {
//             return "err_msg_please_enter_valid_password".tr;
//           }
//           return null;
//         },
//         obscureText: controller.isShowPassword1.value,
//         contentPadding: EdgeInsets.only(left: 20.h, top: 22.v, bottom: 22.v)));
//   }

//   /// Section Widget
//   Widget _buildSignUpButton() {
//     return CustomElevatedButton(
//       text: "lbl_sign_up".tr.toUpperCase(),
//       onPressed: () {
//         print('......................on tap');
//         Get.to(LocationAccessScreen());
//         print('......................on tap');
//       },
//     );
//   }

//   /// Section Widget
//   Widget _buildAppBar() {
//     return Align(
//         alignment: Alignment.topCenter,
//         child: Container(
//             padding: EdgeInsets.symmetric(vertical: 50.v),
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(ImageConstant.imgGroup34),
//                     fit: BoxFit.cover)),
//             child: CustomAppBar(
//                 height: 45.v,
//                 leadingWidth: double.maxFinite,
//                 leading: AppbarLeadingIconbutton(
//                     imagePath: ImageConstant.imgArrowLeftGray70001,
//                     margin: EdgeInsets.only(left: 24.h, right: 306.h),
//                     onTap: () {
//                       onTapArrowLeft();
//                     }))));
//   }

//   /// Navigates to the previous screen.
//   onTapArrowLeft() {
//     Get.back();
//   }
// }
import 'package:abu_s_application7/presentation/sign_up_screen/controller/sign_up_controller.dart';

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
class SignUpScreen extends GetWidget<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    child: Form(
                        key: _formKey,
                        child: SizedBox(
                            height: SizeUtils.height,
                            width: double.maxFinite,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  _buildSignupSection(),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24.h, vertical: 23.v),
                                          decoration: AppDecoration.fillWhiteA
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .customBorderTL24),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        "lbl_name"
                                                            .tr
                                                            .toUpperCase(),
                                                        style: CustomTextStyles
                                                            .bodyMediumBluegray9000213)),
                                                SizedBox(height: 8.v),
                                                CustomTextFormField(
                                                    controller: controller
                                                        .nameFieldController,
                                                    hintText:
                                                        "lbl_name"
                                                            .tr,
                                                    hintStyle: CustomTextStyles
                                                        .bodyMediumBluegray90001_1,
                                                    textInputType: TextInputType
                                                        .emailAddress,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          (!isValidEmail(value,
                                                              isRequired:
                                                                  true))) {
                                                        return "err_msg_please_enter_valid_email"
                                                            .tr;
                                                      }
                                                      return null;
                                                    },
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 19.h,
                                                            vertical: 22.v)),
                                                SizedBox(
                                                  height: 20.v,
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        "lbl_email"
                                                            .tr
                                                            .toUpperCase(),
                                                        style: CustomTextStyles
                                                            .bodyMediumBluegray9000213)),
                                                SizedBox(height: 8.v),
                                                CustomTextFormField(
                                                    controller: controller
                                                        .emailFieldController,
                                                    hintText:
                                                        "msg_example_gmail_com"
                                                            .tr,
                                                    hintStyle: CustomTextStyles
                                                        .bodyMediumBluegray90001_1,
                                                    textInputType: TextInputType
                                                        .emailAddress,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          (!isValidEmail(value,
                                                              isRequired:
                                                                  true))) {
                                                        return "err_msg_please_enter_valid_email"
                                                            .tr;
                                                      }
                                                      return null;
                                                    },
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 19.h,
                                                            vertical: 22.v)),
                                                SizedBox(height: 23.v),
                                                Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        "lbl_password"
                                                            .tr
                                                            .toUpperCase(),
                                                        style: CustomTextStyles
                                                            .bodyMediumBluegray9000213)),
                                                SizedBox(height: 8.v),
                                                Obx(() => CustomTextFormField(
                                                    controller: controller
                                                        .passwordFieldController,
                                                    hintText:
                                                        "lbl_123456789".tr,
                                                    hintStyle: CustomTextStyles
                                                        .bodyMediumBluegray90001_1,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    textInputType: TextInputType
                                                        .visiblePassword,
                                                    suffix: InkWell(
                                                        onTap: () {
                                                          controller
                                                                  .isShowPassword
                                                                  .value =
                                                              !controller
                                                                  .isShowPassword
                                                                  .value;
                                                        },
                                                        child: controller
                                                                .isShowPassword
                                                                .value
                                                            ? Container(
                                                                margin:
                                                                    EdgeInsets.fromLTRB(
                                                                        30.h,
                                                                        21.v,
                                                                        17.h,
                                                                        21.v),
                                                                child: Icon(Icons
                                                                    .visibility_off))
                                                            : Container(
                                                                margin:
                                                                    EdgeInsets.fromLTRB(
                                                                        30.h,
                                                                        21.v,
                                                                        17.h,
                                                                        21.v),
                                                                child:
                                                                    Icon(Icons.visibility))),
                                                    suffixConstraints:
                                                        BoxConstraints(
                                                            maxHeight: 62.v),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          (!isValidPassword(
                                                              value,
                                                              isRequired:
                                                                  true))) {
                                                        return "err_msg_please_enter_valid_password"
                                                            .tr;
                                                      }
                                                      return null;
                                                    },
                                                    obscureText: controller
                                                        .isShowPassword.value,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 19.h,
                                                            top: 22.v,
                                                            bottom: 22.v))),
                                                SizedBox(height: 24.v),
                                                Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        "msg_re_type_password"
                                                            .tr
                                                            .toUpperCase(),
                                                        style: CustomTextStyles
                                                            .bodyMediumBluegray9000213)),
                                                SizedBox(height: 8.v),
                                                CustomTextFormField(
                                                    hintText: 'lbl_123456789',
                                                    controller: controller
                                                        .retypePasswordFieldController,
                                                    hintStyle: CustomTextStyles
                                                        .bodyMediumBluegray90001_1,
                                                    suffixConstraints:
                                                        BoxConstraints(
                                                            maxHeight: 62.v),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          (!isValidPassword(
                                                              value,
                                                              isRequired:
                                                                  true))) {
                                                        return "err_msg_please_enter_valid_password"
                                                            .tr;
                                                      }
                                                      return null;
                                                    },
                                                    obscureText: controller
                                                        .isShowPassword.value,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 19.h,
                                                            top: 22.v,
                                                            bottom: 22.v)),
                                                // _buildRememberMeSection(),
                                                SizedBox(height: 29.v),

                                                CustomElevatedButton(
                                                    onPressed: () {
                                                      controller
                                                          .userRegisterInFirebase();
                                                      // controller.googleSignIn();
                                                      //  Get.toNamed(AppRoutes.locationAccessScreen);
                                                    },
                                                    text: "lbl_sign_up"
                                                        .tr
                                                        .toUpperCase()),
                                                SizedBox(height: 39.v),
                                                // Padding(
                                                //     padding:
                                                //         EdgeInsets.symmetric(
                                                //             horizontal: 39.h),
                                                //     child: Row(
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .center,
                                                //         children: [
                                                //           Text(
                                                //               "msg_don_t_have_an_account"
                                                //                   .tr,
                                                //               style: CustomTextStyles
                                                //                   .bodyLargeSenBluegray600),
                                                //           Padding(
                                                //               padding: EdgeInsets
                                                //                   .only(
                                                //                       left: 0.h,
                                                //                       top: 2.v),
                                                //               child:
                                                //                   GestureDetector(
                                                //                 onTap: () {
                                                //                   Get.toNamed(
                                                //                       AppRoutes
                                                //                           .signUpScreen);
                                                //                 },
                                                //                 child: Text(
                                                //                     "lbl_sign_up"
                                                //                         .tr
                                                //                         .toUpperCase(),
                                                //                     style: CustomTextStyles
                                                //                         .titleSmallPrimary),
                                                //               ))
                                                //         ])),
                                                // SizedBox(height: 29.v),
                                                // Text("lbl_or".tr,
                                                //     style: CustomTextStyles
                                                //         .bodyLargeSenBluegray600),
                                                // SizedBox(height: 14.v),
                                                // Padding(
                                                //     padding:
                                                //         EdgeInsets.symmetric(
                                                //             horizontal: 39.h),
                                                //     child: Row(
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .center,
                                                //         children: [
                                                //           CustomIconButton(
                                                //               height: 62
                                                //                   .adaptSize,
                                                //               width: 62
                                                //                   .adaptSize,
                                                //               padding:
                                                //                   EdgeInsets
                                                //                       .all(
                                                //                           22.h),
                                                //               decoration:
                                                //                   IconButtonStyleHelper
                                                //                       .fillErrorContainer,
                                                //               onTap: () {
                                                //                 onTapBtnFacebook();
                                                //               },
                                                //               child: CustomImageView(
                                                //                   imagePath:
                                                //                       ImageConstant
                                                //                           .imgFacebook)),
                                                //           Padding(
                                                //               padding: EdgeInsets
                                                //                   .only(
                                                //                       left:
                                                //                           30.h),
                                                //               child: CustomIconButton(
                                                //                   height: 62
                                                //                       .adaptSize,
                                                //                   width: 62
                                                //                       .adaptSize,
                                                //                   padding:
                                                //                       EdgeInsets
                                                //                           .all(20
                                                //                               .h),
                                                //                   decoration:
                                                //                       IconButtonStyleHelper
                                                //                           .fillOnError,
                                                //                   child: CustomImageView(
                                                //                       imagePath:
                                                //                           ImageConstant
                                                //                               .imgTrash))),
                                                //           Spacer(),
                                                //           CustomIconButton(
                                                //               height: 62
                                                //                   .adaptSize,
                                                //               width: 62
                                                //                   .adaptSize,
                                                //               padding:
                                                //                   EdgeInsets
                                                //                       .all(
                                                //                           21.h),
                                                //               decoration:
                                                //                   IconButtonStyleHelper
                                                //                       .fillGray,
                                                //               onTap: () {
                                                //                 // controller
                                                //                 //     .googleSignIn();
                                                //                 // //onTapBtnGoogle();
                                                //               },
                                                //               child: CustomImageView(
                                                //                   imagePath:
                                                //                       ImageConstant
                                                //                           .imgGoogle))
                                                //         ])),
                                                SizedBox(height: 14.v)
                                              ])))
                                ])))))));
  }

  /// Section Widget
  Widget _buildSignupSection() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 100.v),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgGroup48),
                    fit: BoxFit.cover)),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("lbl_sign_up".tr, style: theme.textTheme.headlineLarge),
              SizedBox(height: 2.v),
              Opacity(
                  opacity: 0.85,
                  child: Text("msg_please_sign_up_to".tr,
                      style: CustomTextStyles.bodyLargeSenWhiteA700Regular_1)),
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
      //   Padding(
      //       padding: EdgeInsets.only(top: 2.v),
      //       child: GestureDetector(
      //         onTap: () {
      //           Get.toNamed(AppRoutes.forgotPasswordScreen);
      //         },
      //         child: Text("lbl_forgot_password".tr,
      //             style: CustomTextStyles.bodyMediumPrimary),
      //       ))
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
