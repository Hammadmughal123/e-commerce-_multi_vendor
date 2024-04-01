import 'package:abu_s_application7/presentation/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/settings_controller.dart';
import '../../core/app_export.dart';
import '../../presentation/home_page/home_page.dart';
import '../../presentation/orders_tab_container_page/orders_tab_container_page.dart';
import '../../presentation/pickup_page/pickup_page.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton_two.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SettingsScreen extends GetWidget<SettingsController> {
  SettingsScreen({Key? key})
      : super(
          key: key,
        );
  final SettingsController settingsController =
      Get.put<SettingsController>(SettingsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SettingsController>(builder: (ctrl) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: Column(
              children: [
                SizedBox(height: 18.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.v),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 109.v,
                            width: 247.h,
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
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

                                var docSnapshot =
                                    snapshot.data as DocumentSnapshot;
                                if (!docSnapshot.exists) {
                                  return Text('Document does not exist');
                                }

                                var data = docSnapshot
                                    .data()!; // Access the data using data() method
                                //  print('.........................$data');

                                // Now you can access the data as a Map<dynamic, dynamic>
                                var ref = data as Map<dynamic, dynamic>;

                                // Your remaining code goes here...
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade300,
                                            ),
                                            child: data['image'] == null
                                                ? Center(
                                                    child: Icon(
                                                    Icons.person_add_rounded,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ))
                                                : CachedNetworkImage(
                                                    imageUrl: data['image'],
                                                    fit: BoxFit.cover,
                                                    placeholder:
                                                        (context, url) {
                                                      return Center(
                                                        child:
                                                            CupertinoActivityIndicator(),
                                                      );
                                                    },
                                                    errorWidget:
                                                        (context, url, error) {
                                                      return Center(
                                                        child:
                                                            Icon(Icons.error),
                                                      );
                                                    },
                                                  ),
                                          ),
                                          // Container(
                                          //   height: 20,
                                          //   width: 20,
                                          //   decoration: BoxDecoration(
                                          //       shape: BoxShape.circle),
                                          //   child:
                                          //       Center(child: Icon(Icons.add)),
                                          // )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                      Expanded(
                                        child: Text(
                                          data['name'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 21.v),
                          _buildProfileOne(),
                          SizedBox(height: 20.v),
                          _buildCartAndFavorites(),
                          SizedBox(height: 20.v),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('sellerData')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
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
                                return Text('.........No data found');
                              }

                              var docSnapshot =
                                  snapshot.data as DocumentSnapshot;
                              if (!docSnapshot.exists) {
                                return _buildHostTile(
                                    text: "lbl_render".tr,
                                    onTap: () {
                                      Get.toNamed(AppRoutes.sellerDetailScreen);
                                    });
                              }

                              // Use data() method without force-unwrapping
                              var data = docSnapshot.data();

                              if (data != null) {
                                return _buildHostTile(
                                    text: "Seller pennel",
                                    onTap: () {
                                      Get.toNamed(AppRoutes.sellerPannelScreen);
                                    });
                              }

                              // Continue with the rest of your code using the 'data' variable...

                              return SizedBox();
                            },
                          ),

                          //_buildHostTile(),
                          SizedBox(height: 20.v),
                          _buildFaqsAndReviews(),
                          SizedBox(height: 20.v),
                          _buildLogout(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //  bottomNavigationBar: _buildBottomBar(),
        );
      }),
    );
  }

  Future<void> deleCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 69.h,
      // leading: AppbarLeadingIconbuttonThree(
      //   imagePath: ImageConstant.imgClockBlueGray5001,
      //   margin: EdgeInsets.only(
      //     left: 24.h,
      //     top: 5.v,
      //     bottom: 5.v,
      //   ),
      // ),
      title: AppbarSubtitleOne(
        text: "lbl_profile".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarTrailingIconbuttonTwo(
          imagePath: ImageConstant.imgMore,
          margin: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 5.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildProfileOne() {
    return Container(
      margin: EdgeInsets.only(
        left: 13.h,
        right: 35.h,
      ),
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.fillGray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.personalProfilesScreen);
            },
            child: _buildAddress(
              icon: Icon(
                Icons.person_3_outlined,
                color: Colors.black,
              ),
              addresses: "lbl_personal_info".tr,
            ),
          ),
          SizedBox(height: 16.v),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.addressScreen);
            },
            child: _buildAddress(
              addresses: "lbl_addresses".tr,
              icon: Icon(
                Icons.map_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCartAndFavorites() {
    return Container(
      margin: EdgeInsets.only(
        left: 13.h,
        right: 35.h,
      ),
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.fillGray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.addNewCardScreen);
            },
            child: _buildAddress(
              icon: Icon(
                Icons.shopping_cart_checkout_outlined,
                color: Colors.black,
              ),
              addresses: "lbl_cart".tr,
            ),
          ),
          SizedBox(height: 16.v),
          GestureDetector(
            onTap: () {
              //   Get.toNamed(AppRoutes.fa)
            },
            child: _buildAddress(
              icon: Icon(
                Icons.favorite_outline_sharp,
                color: Colors.black,
              ),
              addresses: "lbl_favourite".tr,
            ),
          ),
          SizedBox(height: 16.v),
          GestureDetector(
            onTap: () {
              // Get.toNamed(AppRoutes.)
            },
            child: _buildAddress(
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
              addresses: "lbl_notifications".tr,
            ),
          ),
          SizedBox(height: 16.v),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.paymentMethodTabContainerScreen);
            },
            child: _buildAddress(
              icon: Icon(
                Icons.credit_card,
                color: Colors.black,
              ),
              addresses: "lbl_payment_method".tr,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHostTile({
    required String text,
    required Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        margin: EdgeInsets.only(
          left: 13.h,
          right: 35.h,
        ),
        padding: EdgeInsets.all(20.h),
        decoration: AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40.adaptSize,
              width: 40.adaptSize,
              padding: EdgeInsets.all(13.h),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgLogout,
                color: Colors.black,
                height: 14.v,
                width: 13.h,
                alignment: Alignment.centerRight,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 14.h,
                top: 10.v,
                bottom: 10.v,
              ),
              child: Text(
                text,
                style: CustomTextStyles.bodyMediumBluegray9000115,
              ),
            ),
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRightGray60001,
              color: Colors.black,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 8.v),
            ),
          ],
        ),
      ),
    );
  }
  // Widget _buildHostTiasle({required String text, required Function()? onTap}) {
  //   return GestureDetector(
  //     onTap: onTap ?? () {},
  //     child: Container(
  //       margin: EdgeInsets.only(
  //         left: 13.h,
  //         right: 35.h,
  //       ),
  //       padding: EdgeInsets.all(20.h),
  //       decoration: AppDecoration.fillGray50.copyWith(
  //         borderRadius: BorderRadiusStyle.roundedBorder15,
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           _buildAddress(
  //             icon: Icon(
  //               Icons.card_travel_outlined,
  //               color: Colors.black,
  //             ),
  //             addresses: text,
  //             // "lbl_render".tr,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildFaqsAndReviews() {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(AppRoutes.sellerDetailScreen);
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 13.h,
          right: 35.h,
        ),
        padding: EdgeInsets.all(20.h),
        decoration: AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAddress(
              icon: Icon(
                Icons.help_outline_outlined,
                color: Colors.black,
              ),
              addresses: "lbl_faqs".tr,
            ),
            SizedBox(height: 16.v),
            _buildAddress(
              icon: Icon(
                Icons.reviews_outlined,
                color: Colors.black,
              ),
              addresses: "lbl_user_reviews".tr,
            ),
            SizedBox(height: 16.v),
            _buildAddress(
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.black,
              ),
              addresses: "lbl_settings".tr,
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLogout() {
    return GestureDetector(
      onTap: () {
        FirebaseAuth.instance.signOut().then((value) => {
              deleCache(),
              Get.toNamed(AppRoutes.onboardingOneScreen),
            });
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 13.h,
          right: 35.h,
        ),
        padding: EdgeInsets.all(20.h),
        decoration: AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40.adaptSize,
              width: 40.adaptSize,
              padding: EdgeInsets.all(13.h),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgLogout,
                color: Colors.black,
                height: 14.v,
                width: 13.h,
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 14.h,
                top: 10.v,
                bottom: 10.v,
              ),
              child: Text(
                "lbl_log_out".tr,
                style: CustomTextStyles.bodyMediumBluegray9000115,
              ),
            ),
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRightGray60001,
              color: Colors.black,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 8.v),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  // Widget _buildBottomBar() {
  //   return CustomBottomBar(
  //     onChanged: (BottomBarEnum type) {
  //       Get.toNamed(getCurrentRoute(type), id: 1);
  //     },
  //   );
  // }

  /// Common widget
  Widget _buildAddress({required String addresses, required Widget icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
            height: 40.adaptSize,
            width: 40.adaptSize,
            // padding: EdgeInsets.all(13.h),
            decoration: IconButtonStyleHelper.outlineWhiteATL20,
            // alignment: Alignment.centerLeft,
            child: icon),
        Padding(
          padding: EdgeInsets.only(
            left: 14.h,
            top: 10.v,
            bottom: 9.v,
          ),
          child: Text(
            addresses,
            style: CustomTextStyles.bodyLargeSenBluegray90001.copyWith(
              color: appTheme.blueGray90001,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRightGray60001,
          color: Colors.black,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 8.v),
        ),
      ],
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Settingsbluegray800:
        return AppRoutes.ordersTabContainerPage;
      case BottomBarEnum.Settings:
        return AppRoutes.homePage;
      case BottomBarEnum.Search:
        return AppRoutes.pickupPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.ordersTabContainerPage:
        return OrdersTabContainerPage();
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.pickupPage:
        return PickupPage();
      default:
        return DefaultWidget();
    }
  }
}
