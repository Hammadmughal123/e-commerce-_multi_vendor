import '../store_view_one_tab_container_screen/widgets/twentyfive_item_widget.dart';
import 'controller/store_view_one_tab_container_controller.dart';
import 'models/twentyfive_item_model.dart';
import '../../core/app_export.dart';
import '../../presentation/store_view_one_page/store_view_one_page.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton_four.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class StoreViewOneTabContainerScreen
    extends GetWidget<StoreViewOneTabContainerController> {
  const StoreViewOneTabContainerScreen({Key? key})
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
              _buildImageStack(),
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
                                    imagePath: ImageConstant.imgStar16,
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
                      SizedBox(height: 17.v),
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: Text(
                          "msg_spicy_restaurant".tr,
                          style: CustomTextStyles.titleLargeGray900,
                        ),
                      ),
                      SizedBox(height: 9.v),
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
  Widget _buildImageStack() {
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
                      itemCount: controller.storeViewOneTabContainerModelObj
                          .value.twentyfiveItemList.value.length,
                      itemBuilder: (context, index, realIndex) {
                        TwentyfiveItemModel model = controller
                            .storeViewOneTabContainerModelObj
                            .value
                            .twentyfiveItemList
                            .value[index];
                        return TwentyfiveItemWidget(
                          model,
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Obx(
                      () => Container(
                        height: 10.v,
                        margin: EdgeInsets.only(bottom: 13.v),
                        child: AnimatedSmoothIndicator(
                          activeIndex: controller.sliderIndex.value,
                          count: controller.storeViewOneTabContainerModelObj
                              .value.twentyfiveItemList.value.length,
                          axisDirection: Axis.horizontal,
                          effect: ScrollingDotsEffect(
                            spacing: 10.28,
                            activeDotColor: appTheme.whiteA700,
                            dotColor: appTheme.whiteA700.withOpacity(0.41),
                            dotHeight: 10.v,
                            dotWidth: 10.h,
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
              text: "lbl_burger".tr,
              buttonStyle: CustomButtonStyles.fillYellowTL23,
              buttonTextStyle: CustomTextStyles.bodyLargeSenWhiteA700Regular,
            ),
          ),
          Tab(
            child: SizedBox(
              height: 46.v,
              width: 102.h,
              child: Stack(
                alignment: Alignment.center,
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
                    alignment: Alignment.center,
                    child: Text(
                      "lbl_sandwich".tr,
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
                      "lbl_pizza".tr,
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
                        "lbl_sanwich".tr,
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
          StoreViewOnePage(),
          StoreViewOnePage(),
          StoreViewOnePage(),
          StoreViewOnePage(),
        ],
      ),
    );
  }
}
