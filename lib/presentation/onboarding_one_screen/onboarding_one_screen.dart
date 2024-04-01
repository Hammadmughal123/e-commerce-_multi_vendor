import 'controller/onboarding_one_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class OnboardingOneScreen extends GetWidget<OnboardingOneController> {
  const OnboardingOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 37.v),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 48.v),
                CustomImageView(
                  imagePath: ImageConstant.img1Prancheta1CPia,
                  height: 358.v,
                  width: 375.h,
                ),
                // SizedBox(height: 26.v),
                // Text(
                //   "msg_all_your_favorites".tr,
                //   style: theme.textTheme.headlineSmall,
                // ),
                SizedBox(height: 17.v),
                Container(
                  width: 319.h,
                  margin: EdgeInsets.only(
                    left: 27.h,
                    right: 28.h,
                  ),
                  child: Text(
                    "Find the best available\n Professional near by you".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyLargeSenBluegray600.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
                SizedBox(height: 30.v),
                SizedBox(
                  height: 10.v,
                  child: AnimatedSmoothIndicator(
                    activeIndex: 0,
                    count: 3,
                    effect: ScrollingDotsEffect(
                      spacing: 12,
                      activeDotColor: theme.colorScheme.primary,
                      dotColor: appTheme.red100,
                      dotHeight: 10.v,
                      dotWidth: 10.h,
                    ),
                  ),
                ),
                SizedBox(height: 69.v),
                CustomElevatedButton(
                  onPressed: (){
                    Get.toNamed(AppRoutes.onboardingTwoScreen);
                  },
                  text: "lbl_next".tr.toUpperCase(),
                  margin: EdgeInsets.symmetric(horizontal: 24.h),
                ),
                SizedBox(height: 17.v),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.logInScreen);
                  },
                  child: Text(
                    "lbl_skip".tr,
                    style: CustomTextStyles.bodyLargeSenBluegray600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
