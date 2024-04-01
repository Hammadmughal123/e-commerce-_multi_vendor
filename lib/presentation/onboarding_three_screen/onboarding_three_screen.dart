import 'controller/onboarding_three_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class OnboardingThreeScreen extends GetWidget<OnboardingThreeController> {
  const OnboardingThreeScreen({Key? key})
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.img3Prancheta1CPia,
                height: 408.v,
                width: 375.h,
              ),
              // SizedBox(height: 1.v),
              // Text(
              //   "msg_free_delivery_offers".tr,
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
                  "Your product is delivered in your\n place quickly and free among locals"
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
                  activeIndex: 2,
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
                  Get.toNamed(AppRoutes.logInScreen);
                },
                text: "lbl_get_started".tr.toUpperCase(),
                margin: EdgeInsets.symmetric(horizontal: 24.h),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
