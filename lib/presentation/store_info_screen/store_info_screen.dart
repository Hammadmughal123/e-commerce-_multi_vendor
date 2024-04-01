import 'package:abu_s_application7/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:abu_s_application7/presentation/seller_pannel/seller_screens/add_new_seller/model/seller_detail_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'controller/store_info_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_subtitle_three.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class StoreInfoScreen extends GetWidget<StoreInfoController> {
  StoreInfoScreen({Key? key}) : super(key: key);
  var data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(data),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 18.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('sellerData')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Text('No data found');
                  }

                  var docSnapshot = snapshot.data as DocumentSnapshot;
                  if (!docSnapshot.exists) {
                    return Text('Document does not exist');
                  }

                  data =
                      docSnapshot.data(); // Access the data using data() method
                  print('.................data coming........$data');

                  // Now you can access the data as a Map<dynamic, dynamic>
                  //  var ref = data as Map<dynamic, dynamic>;

                  // Your remaining code goes here...
                  SellerDetailModel model = SellerDetailModel.fromJson(data);
                  return Column(
                    children: [
                      SizedBox(
                        height: 109.v,
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // alignment: Alignment.topLeft,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300),
                                child: CachedNetworkImage(
                                  imageUrl: model.sellerShopImages![0],
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) {
                                    return Center(
                                      child: CupertinoActivityIndicator(),
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return Center(
                                      child: Icon(Icons.error),
                                    );
                                  },
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 10),
                                    child: Text(
                                      model.storeName ?? '',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, left: 10),
                                    child: Text(
                                      model.sellerBio ?? '',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 23.v),
                      _buildPersonalInfo(
                        model.storeName ?? '',
                        model.sellerNumber ?? '',
                        model.storeEmail ?? '',

                        // data['storeName'],
                        // data['sellerNumber'],
                        // data['storeEmail'],
                      ),
                      SizedBox(height: 5.v),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(var data) {
    return CustomAppBar(
      leadingWidth: 69.h,
      leading: AppbarLeadingIconbuttonThree(
        onTap: () {
          Get.back();
        },
        imagePath: ImageConstant.imgClockBlueGray5001,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 5.v,
          bottom: 5.v,
        ),
      ),
      title: AppbarSubtitleOne(
        text: "lbl_personal_info".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarSubtitleThree(
          onTap: () {
            Get.to(EditProfileScreen());
          },
          text: "lbl_edit".tr.toUpperCase(),
          margin: EdgeInsets.fromLTRB(24.h, 21.v, 24.h, 17.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildPersonalInfo(
      String userName, String userNumber, String userEmail) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 327.h,
        margin: EdgeInsets.symmetric(horizontal: 24.h),
        padding: EdgeInsets.all(20.h),
        decoration: AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomIconButton(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  padding: EdgeInsets.all(13.h),
                  decoration: IconButtonStyleHelper.outlineWhiteATL20,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgLock,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 13.h,
                    top: 3.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_full_name".tr.toUpperCase(),
                        style: CustomTextStyles.bodyMediumBluegray90001_1,
                      ),
                      SizedBox(height: 2.v),
                      Text(
                        userName,
                        style: CustomTextStyles.bodyMediumGray60003,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.v),
            Row(
              children: [
                CustomIconButton(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  padding: EdgeInsets.all(11.h),
                  decoration: IconButtonStyleHelper.outlineWhiteATL20,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgLockIndigoA700,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 14.h,
                    top: 2.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_email".tr.toUpperCase(),
                        style: CustomTextStyles.bodyMediumBluegray90001_1,
                      ),
                      SizedBox(height: 2.v),
                      Text(
                        userEmail,
                        style: CustomTextStyles.bodyMediumGray60003,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.v),
            Row(
              children: [
                CustomIconButton(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  padding: EdgeInsets.all(12.h),
                  decoration: IconButtonStyleHelper.outlineWhiteATL20,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCall,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 14.h,
                    top: 2.v,
                    bottom: 2.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_phone_number".tr.toUpperCase(),
                        style: CustomTextStyles.bodyMediumBluegray90001_1,
                      ),
                      SizedBox(height: 1.v),
                      Text(
                        userNumber,
                        style: CustomTextStyles.bodyMediumGray60003,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
