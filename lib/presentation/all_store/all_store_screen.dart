import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/widgets/store_widget/store_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton_two.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../seller_pannel/seller_screens/add_new_seller/model/seller_detail_model.dart';
import 'controllers/all_store_controller.dart';

// ignore_for_file: must_be_immutable
class AllStoreScreen extends GetWidget<AllStoreController> {
  const AllStoreScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    Get.find<AllStoreController>();
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                StoreWidget()
              ],
            ),
          ),
        ),
        //bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Text(
        'Stores & Restaurants',
        style: GoogleFonts.sen(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      leadingWidth: 69.h,
      leading: AppbarLeadingIconbuttonThree(
        onTap: () {
          Get.back();
        },
        imagePath: ImageConstant.imgClockBlueGray5001,
        margin: EdgeInsets.only(
          //left: 24.h,
          top: 10.v,
          bottom: 10.v,
        ),
      ),
      actions: [
        AppbarTrailingIconbuttonOne(
          imagePath: ImageConstant.imgRewindWhiteA700,
          margin: EdgeInsets.only(),
        ),
        AppbarTrailingIconbuttonTwo(
          imagePath: ImageConstant.imgSettingsGray900,
          margin: EdgeInsets.only(
            left: 10.h,
            top: 5.v,
            right: 29.h,
          ),
        ),
      ],
    );
  }

  /// Section Widget
}
