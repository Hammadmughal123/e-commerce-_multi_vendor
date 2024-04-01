import 'package:google_fonts/google_fonts.dart';

import 'controller/onboarding_two_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class OnboardingTwoScreen extends GetWidget<OnboardingTwoController> {
  const OnboardingTwoScreen({Key? key})
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
                SizedBox(height: 33.v),
                CustomImageView(
                  imagePath: ImageConstant.img2Prancheta1CPia,
                  height: 388.v,
                  width: 375.h,
                ),
                // SizedBox(height: 10.v),
                // Text(
                //   "Find the Best Product you like".tr,
                //   style: GoogleFonts.sen(
                //       fontSize: 17,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black),
                // ),
                SizedBox(height: 19.v),
                Container(
                  width: 319.h,
                  margin: EdgeInsets.only(
                    left: 27.h,
                    right: 28.h,
                  ),
                  child: Text(
                    "Search for your favourite items\n you like within the best price"
                        .tr,
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
                    activeIndex: 1,
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
                  onPressed: () {
                    Get.toNamed(AppRoutes.onboardingThreeScreen);
                  },
                  text: "lbl_next".tr.toUpperCase(),
                  margin: EdgeInsets.symmetric(horizontal: 24.h),
                ),
                SizedBox(height: 17.v),
                GestureDetector(
                  onTap: () {
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
