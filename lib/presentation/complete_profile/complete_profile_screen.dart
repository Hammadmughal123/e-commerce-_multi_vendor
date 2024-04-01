// import '../../core/app_export.dart';
// import '../../core/utils/validation_functions.dart';
// import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
// import '../../widgets/app_bar/appbar_subtitle_one.dart';
// import '../../widgets/app_bar/custom_app_bar.dart';
// import '../../widgets/custom_elevated_button.dart';
// import '../../widgets/custom_icon_button.dart';
// import '../../widgets/custom_text_form_field.dart';
// import 'package:flutter/material.dart';

// import 'controller/profile_controller.dart';

// // ignore_for_file: must_be_immutable
// class CompleteProfile extends GetWidget<CompleteProfileController> {
//   CompleteProfile({Key? key})
//       : super(
//           key: key,
//         );

//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: GetBuilder<CompleteProfileController>(builder: (ctrl) {
//         return Scaffold(
//           resizeToAvoidBottomInset: false,
//           appBar: _buildAppBar(),
//           body: Form(
//             key: _formKey,
//             child: Container(
//               width: double.maxFinite,
//               padding: EdgeInsets.symmetric(vertical: 30.v),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 7.v),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 5.v),
//                       padding: EdgeInsets.symmetric(horizontal: 24.h),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 155.v,
//                             width: 236.h,
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Align(
//                                   alignment: Alignment.center,
//                                   child: Container(
//                                     height: 130.adaptSize,
//                                     width: 130.adaptSize,
//                                     decoration: BoxDecoration(
//                                       color: Colors.grey.shade300,
//                                       borderRadius: BorderRadius.circular(
//                                         65.h,
//                                       ),
//                                     ),
//                                     child: ctrl.userImage != null
//                                         ? ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(80),
//                                             child: Image.memory(
//                                               ctrl.userImage!,
//                                               fit: BoxFit.cover,
//                                             ))
//                                         : Center(
//                                             child: Icon(
//                                               Icons.person,
//                                               size: 50,
//                                             ),
//                                           ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   bottom: 6,
//                                   right: 40,
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       ctrl.imageDailogue(context);
//                                     },
//                                     child: Container(
//                                       height: 50,
//                                       width: 50,
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.white),
//                                       child: Icon(
//                                         Icons.add,
//                                         weight: 26,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 17.v),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "lbl_full_name".tr.toUpperCase(),
//                               style: CustomTextStyles.bodyMediumBluegray90001_1,
//                             ),
//                           ),
//                           SizedBox(height: 8.v),
//                           _buildProfileFullName(),
//                           SizedBox(height: 23.v),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "lbl_phone_number".tr.toUpperCase(),
//                               style: CustomTextStyles.bodyMediumBluegray90001_1,
//                             ),
//                           ),
//                           SizedBox(height: 8.v),
//                           _buildProfilePhoneNumber(),
//                           SizedBox(height: 23.v),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "lbl_bio".tr.toUpperCase(),
//                               style: CustomTextStyles.bodyMediumBluegray9000113,
//                             ),
//                           ),
//                           SizedBox(height: 8.v),
//                           _buildProfileBioValue(),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           bottomNavigationBar: CustomElevatedButton(
//             onPressed: () {
//               ctrl.uploadUserDataInFirebase();
//             },
//             text: "lbl_save".tr.toUpperCase(),
//             margin: EdgeInsets.only(
//               left: 24.h,
//               right: 24.h,
//               bottom: 30.v,
//             ),
//             buttonTextStyle: theme.textTheme.titleMedium!,
//           ),
//         );
//       }),
//     );
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppBar() {
//     return CustomAppBar(
//       leadingWidth: 69.h,
//       leading: AppbarLeadingIconbuttonThree(
//         onTap: () {
//           Get.back();
//         },
//         imagePath: ImageConstant.imgClockBlueGray5001,
//         margin: EdgeInsets.only(
//           left: 24.h,
//           top: 5.v,
//           bottom: 5.v,
//         ),
//       ),
//       title: AppbarSubtitleOne(
//         text: "Complete Profile".tr,
//         margin: EdgeInsets.only(left: 16.h),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildProfileFullName() {
//     return CustomTextFormField(
//       controller: controller.profileFullNameController,
//       hintText: "lbl_jon_bro".tr,
//       hintStyle: CustomTextStyles.bodyMediumGray60003,
//     );
//   }

//   /// Section Widget
//   // Widget _buildProfileEmail() {
//   //   return CustomTextFormField(
//   //     controller: controller.profileEmailController,
//   //     hintText: "msg_hello_operator_co".tr,
//   //     hintStyle: CustomTextStyles.bodyMediumGray60003,
//   //     textInputType: TextInputType.emailAddress,
//   //     validator: (value) {
//   //       if (value == null || (!isValidEmail(value, isRequired: true))) {
//   //         return "err_msg_please_enter_valid_email".tr;
//   //       }
//   //       return null;
//   //     },
//   //   );
//   // }

//   /// Section Widget
//   Widget _buildProfilePhoneNumber() {
//     return CustomTextFormField(
//       controller: controller.profilePhoneNumberController,
//       hintText: "lbl_408_841_0926".tr,
//       hintStyle: CustomTextStyles.bodyMediumGray60003,
//     );
//   }

//   /// Section Widget
//   Widget _buildProfileBioValue() {
//     return CustomTextFormField(
//       controller: controller.profileBioValueController,
//       hintText: "msg_eat_good".tr,
//       hintStyle: CustomTextStyles.bodyMediumGray60003,
//       textInputAction: TextInputAction.done,
//       maxLines: 5,
//     );
//   }

//   /// Section Widget
//   Widget _buildSaveButton() {
//     return CustomElevatedButton(
//       onPressed: () {
//         //  ctrl.uploadUserDataInFirebase();
//       },
//       text: "lbl_save".tr.toUpperCase(),
//       margin: EdgeInsets.only(
//         left: 24.h,
//         right: 24.h,
//         bottom: 30.v,
//       ),
//       buttonTextStyle: theme.textTheme.titleMedium!,
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/profile_controller.dart';

class CompleteProfile extends GetWidget<CompleteProfileController> {
  CompleteProfile({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteProfileController>(builder: (ctrl) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: _buildProfilePicture(context),
                  ),
                  const SizedBox(height: 30),
                  _buildProfileFullName(),
                  const SizedBox(height: 20),
                  _buildProfilePhoneNumber(),
                  const SizedBox(height: 20),
                  _buildProfileBioValue(),
                  const SizedBox(height: 40),
                  _buildSaveButton(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 69,
      leading: AppbarLeadingIconbuttonThree(
        onTap: () {
          Get.back();
        },
        imagePath: ImageConstant.imgClockBlueGray5001,
        margin: const EdgeInsets.only(left: 24),
      ),
      title: AppbarSubtitleOne(
        text: "Complete Profile",
        margin: const EdgeInsets.only(left: 16),
      ),
    );
  }

  Widget _buildProfilePicture(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: controller.userImage != null
              ? ClipOval(
                  child: Image.memory(
                    controller.userImage!,
                    fit: BoxFit.cover,
                  ),
                )
              : const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.blueGrey,
                ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: GestureDetector(
            onTap: () {
              controller.imageDailogue(context);
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.camera_alt,
                size: 24,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileFullName() {
    return CustomTextFormField(
      controller: controller.profileFullNameController,
      labeltext: "Full Name",
      labelStyle: const TextStyle(color: Colors.blueGrey),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your full name";
        }
        return null;
      },
    );
  }

  Widget _buildProfilePhoneNumber() {
    return CustomTextFormField(
      controller: controller.profilePhoneNumberController,
      labeltext: "Phone Number",
      labelStyle: const TextStyle(color: Colors.blueGrey),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your phone number";
        }
        return null;
      },
    );
  }

  Widget _buildProfileBioValue() {
    return CustomTextFormField(
      controller: controller.profileBioValueController,
      labeltext: "Bio",
      labelStyle: const TextStyle(color: Colors.blueGrey),
      maxLines: 5,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter a short bio";
        }
        return null;
      },
    );
  }

  Widget _buildSaveButton() {
    return CustomElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          controller.uploadUserDataInFirebase();
        }
      },
      text: "Save".toUpperCase(),
      buttonTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
