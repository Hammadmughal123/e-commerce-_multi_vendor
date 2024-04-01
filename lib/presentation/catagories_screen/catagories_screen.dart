import 'package:abu_s_application7/presentation/catagories_screen/widgets/category_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/catagories_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton_two.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CatagoriesScreen extends GetWidget<CatagoriesController> {
  const CatagoriesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              AllCategory()
              //CategoryGridView()
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Text(
        'All Categories',
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
}
