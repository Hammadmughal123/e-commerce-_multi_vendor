import 'controller/search_tab_container_controller.dart';
import '../../core/app_export.dart';
import '../../presentation/search_page/search_page.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_two.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class SearchTabContainerScreen extends GetWidget<SearchTabContainerController> {
  const SearchTabContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 20.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.h),
                                  child: CustomSearchView(
                                      controller: controller.searchController,
                                      hintText: "lbl_pizza".tr,
                                      alignment: Alignment.center))),
                          SizedBox(height: 25.v),
                          Padding(
                              padding: EdgeInsets.only(left: 24.h),
                              child: Text("lbl_recent_keywords".tr,
                                  style: theme.textTheme.titleLarge)),
                          SizedBox(height: 9.v),
                          _buildTabview(),
                          SizedBox(
                              height: 521.v,
                              child: TabBarView(
                                  controller: controller.tabviewController,
                                  children: [
                                    SearchPage(),
                                    SearchPage(),
                                    SearchPage(),
                                    SearchPage()
                                  ]))
                        ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 69.h,
        leading: AppbarLeadingIconbuttonTwo(
            imagePath: ImageConstant.imgArrowLeftGray900,
            margin: EdgeInsets.only(left: 24.h, top: 7.v, bottom: 3.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitleOne(
            text: "lbl_search".tr, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgBag,
              margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 3.v))
        ]);
  }

  /// Section Widget
  Widget _buildTabview() {
    return Container(
        height: 46.v,
        width: 351.h,
        child: TabBar(
            controller: controller.tabviewController,
            isScrollable: true,
            tabs: [
              Tab(
                  child: SizedBox(
                      height: 46.v,
                      width: 89.h,
                      child: Stack(alignment: Alignment.bottomLeft, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgUpload,
                            height: 46.v,
                            width: 89.h,
                            radius: BorderRadius.circular(23.h),
                            alignment: Alignment.center),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 27.h, bottom: 10.v),
                                child: Text("lbl_bag".tr)))
                      ]))),
              Tab(
                  child: SizedBox(
                      height: 46.v,
                      width: 102.h,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle1344,
                            height: 46.v,
                            width: 102.h,
                            radius: BorderRadius.circular(23.h),
                            alignment: Alignment.center),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 10.v),
                                child: Text("lbl_earphone".tr)))
                      ]))),
              Tab(
                  child: SizedBox(
                      height: 46.v,
                      width: 72.h,
                      child: Stack(alignment: Alignment.centerLeft, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgUpload,
                            height: 46.v,
                            width: 72.h,
                            radius: BorderRadius.circular(23.h),
                            alignment: Alignment.center),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 15.h),
                                child: Text("lbl_shirt".tr)))
                      ]))),
              Tab(
                  child: SizedBox(
                      height: 46.v,
                      width: 86.h,
                      child: Stack(alignment: Alignment.center, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgUpload,
                            height: 46.v,
                            width: 86.h,
                            radius: BorderRadius.circular(23.h),
                            alignment: Alignment.center),
                        Align(
                            alignment: Alignment.center,
                            child: Text("lbl_sanwich".tr))
                      ])))
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
