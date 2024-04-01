import '../store_view_two_tab_container_screen/widgets/thirtytwo_item_widget.dart';
import 'controller/store_view_two_tab_container_controller.dart';
import 'models/thirtytwo_item_model.dart';
import '../../core/app_export.dart';
import '../../presentation/store_view_two_page/store_view_two_page.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton_four.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class StoreViewTwoTabContainerScreen
    extends GetWidget<StoreViewTwoTabContainerController> {
  const StoreViewTwoTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildIamge(),
              SizedBox(height: 25.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24.h,
                          right: 90.h,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 53.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgStar17,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                    radius: BorderRadius.circular(
                                      1.h,
                                    ),
                                  ),
                                  Text(
                                    "lbl_4_7".tr,
                                    style: CustomTextStyles.titleMediumGray900,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(
                              flex: 50,
                            ),
                            SizedBox(
                              width: 63.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgTelevision,
                                    height: 16.v,
                                    width: 23.h,
                                  ),
                                  Text(
                                    "lbl_free".tr,
                                    style: CustomTextStyles.bodyMediumGray900,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(
                              flex: 50,
                            ),
                            SizedBox(
                              width: 73.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgClock,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  ),
                                  Text(
                                    "lbl_20_min".tr,
                                    style: CustomTextStyles.bodyMediumGray900,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: Text(
                          "msg_american_general".tr,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ),
                      SizedBox(height: 11.v),
                      Container(
                        width: 310.h,
                        margin: EdgeInsets.only(
                          left: 24.h,
                          right: 41.h,
                        ),
                        child: Text(
                          "msg_maecenas_sed_diam".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            height: 1.71,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.v),
                      _buildTabview(),
                      _buildTabBarView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildIamge() {
    return SizedBox(
      height: 321.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 321.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Obx(
                    () => CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 321.v,
                        initialPage: 0,
                        autoPlay: true,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: false,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (
                          index,
                          reason,
                        ) {
                          controller.sliderIndex.value = index;
                        },
                      ),
                      itemCount: controller.storeViewTwoTabContainerModelObj
                          .value.thirtytwoItemList.value.length,
                      itemBuilder: (context, index, realIndex) {
                        ThirtytwoItemModel model = controller
                            .storeViewTwoTabContainerModelObj
                            .value
                            .thirtytwoItemList
                            .value[index];
                        return ThirtytwoItemWidget(
                          model,
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Obx(
                      () => Container(
                        height: 20.v,
                        margin: EdgeInsets.only(bottom: 8.v),
                        child: AnimatedSmoothIndicator(
                          activeIndex: controller.sliderIndex.value,
                          count: controller.storeViewTwoTabContainerModelObj
                              .value.thirtytwoItemList.value.length,
                          axisDirection: Axis.horizontal,
                          effect: ScrollingDotsEffect(
                            activeDotColor: Color(0X1212121D),
                            dotHeight: 20.v,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomAppBar(
            height: 95.v,
            leadingWidth: 69.h,
            leading: AppbarLeadingIconbuttonThree(
              imagePath: ImageConstant.imgClockWhiteA700,
              margin: EdgeInsets.only(left: 24.h),
            ),
            actions: [
              AppbarTrailingIconbuttonFour(
                imagePath: ImageConstant.imgMore,
                margin: EdgeInsets.symmetric(horizontal: 24.h),
              ),
            ],
          ),
        ],
      ),
    );
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
            child: CustomElevatedButton(
              height: 46.v,
              width: 89.h,
              text: "lbl_fruit".tr,
              buttonStyle: CustomButtonStyles.fillYellowTL23,
              buttonTextStyle: CustomTextStyles.bodyLargeSenWhiteA700Regular,
            ),
          ),
          Tab(
            child: SizedBox(
              height: 46.v,
              width: 102.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle1344,
                    height: 46.v,
                    width: 102.h,
                    radius: BorderRadius.circular(
                      23.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.v),
                      child: Text(
                        "lbl_shampoo".tr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              height: 46.v,
              width: 72.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgUpload,
                    height: 46.v,
                    width: 72.h,
                    radius: BorderRadius.circular(
                      23.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "lbl_bread".tr,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              height: 46.v,
              width: 86.h,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgUpload,
                    height: 46.v,
                    width: 86.h,
                    radius: BorderRadius.circular(
                      23.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.h),
                      child: Text(
                        "lbl_noodles".tr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabBarView() {
    return SizedBox(
      height: 251.v,
      child: TabBarView(
        controller: controller.tabviewController,
        children: [
          StoreViewTwoPage(),
          StoreViewTwoPage(),
          StoreViewTwoPage(),
          StoreViewTwoPage(),
        ],
      ),
    );
  }
}
