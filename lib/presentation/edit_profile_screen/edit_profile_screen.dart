  // import 'package:cached_network_image/cached_network_image.dart';

  // import 'controller/edit_profile_controller.dart';
  // import '../../core/app_export.dart';
  // import '../../core/utils/validation_functions.dart';
  // import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
  // import '../../widgets/app_bar/appbar_subtitle_one.dart';
  // import '../../widgets/app_bar/custom_app_bar.dart';
  // import '../../widgets/custom_elevated_button.dart';
  // import '../../widgets/custom_icon_button.dart';
  // import '../../widgets/custom_text_form_field.dart';
  // import 'package:flutter/material.dart';

  // // ignore_for_file: must_be_immutable
  // class EditProfileScreen extends GetWidget<EditProfileController> {
  //   final dynamic data;
  //   EditProfileScreen({Key? key, this.data})
  //       : super(
  //           key: key,
  //         );
  //   final EditProfileController ctrl = Get.put<EditProfileController>(EditProfileController());

    

  //   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //   @override
  //   Widget build(BuildContext context) {
  //       ctrl.profileEmailController.text=data['email'];
  //     print('..................................${ctrl.profileEmailController.text}');
  //     return SafeArea(
  //       child: Scaffold(
  //         resizeToAvoidBottomInset: false,
  //         appBar: _buildAppBar(),
  //         body: Form(
  //           key: _formKey,
  //           child: Container(
  //             width: double.maxFinite,
  //             padding: EdgeInsets.symmetric(vertical: 30.v),
  //             child: Column(
  //               children: [
  //                 SizedBox(height: 7.v),
  //                 Expanded(
  //                   child: SingleChildScrollView(
  //                     child: Container(
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
  //                                       color: appTheme.deepOrange100,
  //                                       borderRadius: BorderRadius.circular(
  //                                         65.h,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Align(
  //                                   alignment: Alignment.center,
  //                                   child: SizedBox(
  //                                     height: 155.v,
  //                                     width: 236.h,
  //                                     child: Stack(
  //                                       alignment: Alignment.bottomRight,
  //                                       children: [
  //                                         CachedNetworkImage(
  //                                           imageUrl:
  //                                               data != null ? data['image'] : '',
  //                                           placeholder: (context, url) {
  //                                             return Center(
  //                                               child:
  //                                                   CircularProgressIndicator(),
  //                                             );
  //                                           },
  //                                           errorWidget: (context, url, error) =>
  //                                               Icon(Icons.error),
  //                                         ),

  //                                         // Image.network(data['iamge']),
  //                                         // CustomImageView(
  //                                         //   imagePath: ImageConstant.imgProfile01,
  //                                         //   height: 155.v,
  //                                         //   width: 236.h,
  //                                         //   alignment: Alignment.center,
  //                                         // ),
  //                                         Padding(
  //                                           padding: EdgeInsets.only(
  //                                             right: 51.h,
  //                                             bottom: 13.v,
  //                                           ),
  //                                           child: CustomIconButton(
  //                                             height: 41.adaptSize,
  //                                             width: 41.adaptSize,
  //                                             padding: EdgeInsets.all(12.h),
  //                                             decoration: IconButtonStyleHelper
  //                                                 .fillPrimary,
  //                                             alignment: Alignment.bottomRight,
  //                                             child: CustomImageView(
  //                                               color: Colors.black,
  //                                               imagePath: ImageConstant.imgEdit,
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 ),
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
  //                               "lbl_email".tr.toUpperCase(),
  //                               style: CustomTextStyles.bodyMediumBluegray90001_1,
  //                             ),
  //                           ),
  //                           SizedBox(height: 8.v),
  //                           _buildProfileEmail(),
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
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         bottomNavigationBar: _buildSaveButton(),
  //       ),
  //     );
  //   }

  //   /// Section Widget
  //   PreferredSizeWidget _buildAppBar() {
  //     return CustomAppBar(
  //       leadingWidth: 69.h,
  //       leading: AppbarLeadingIconbuttonThree(
  //         imagePath: ImageConstant.imgClockBlueGray5001,
  //         margin: EdgeInsets.only(
  //           left: 24.h,
  //           top: 5.v,
  //           bottom: 5.v,
  //         ),
  //       ),
  //       title: AppbarSubtitleOne(
  //         text: "lbl_edit_profile".tr,
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
  //   Widget _buildProfileEmail() {
  //     return CustomTextFormField(
  //       controller: controller.profileEmailController,
  //       hintText: "msg_hello_operator_co".tr,
  //       hintStyle: CustomTextStyles.bodyMediumGray60003,
  //       textInputType: TextInputType.emailAddress,
  //       validator: (value) {
  //         if (value == null || (!isValidEmail(value, isRequired: true))) {
  //           return "err_msg_please_enter_valid_email".tr;
  //         }
  //         return null;
  //       },
  //     );
  //   }

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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch user data and set it to the controllers
    fetchUserData();
  }

  void fetchUserData() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    setState(() {
      _nameController.text = userData['name'];
      _bioController.text = userData['bio'];
    });
  }

  void _updateProfile() async {
    String newName = _nameController.text.trim();
    String newBio = _bioController.text.trim();

    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'name': newName,
      'bio': newBio,
      // Add other fields as needed
    });

    // Optionally, you can navigate back to the previous screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            onPressed: _updateProfile,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _bioController,
              decoration: InputDecoration(labelText: 'Bio'),
            ),
            // Add other fields as needed
          ],
        ),
      ),
    );
  }
}
