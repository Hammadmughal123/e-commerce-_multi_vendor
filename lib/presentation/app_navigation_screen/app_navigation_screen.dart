import 'controller/app_navigation_controller.dart';
import '../../core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "Splash ".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Onboarding_One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Onboarding_Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Onboarding_Three".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingThreeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Log In".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.logInScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Forgot Password".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.forgotPasswordScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Verification".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.verificationScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Sign Up ".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Location Access".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.locationAccessScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Search - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.searchTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Catagories".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.catagoriesScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "item_detail_One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.itemDetailOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "item_detail_Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.itemDetailTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Store_view_One - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.storeViewOneTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Store_view_Two - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.storeViewTwoTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Message Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.messageScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Orders - Container".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.ordersContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Edit Cart".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.editCartScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "My Cart".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.myCartScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Schedule Order".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.scheduleOrderScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Track Schedule Order".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.trackScheduleOrderScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Payment Method - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.paymentMethodTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Add New Card".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.addNewCardScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Payment Successfull".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.paymentSuccessfullScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Settings".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.settingsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Personal Profiles".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.personalProfilesScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Edit Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.editProfileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Address".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.addressScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Add New Address".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.addNewAddressScreen),
                        ),
                      ],
                    ),
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
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
