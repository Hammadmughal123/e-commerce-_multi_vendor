import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/bottom_bar/bottom_bar_controller.dart';
import 'package:abu_s_application7/presentation/home_page/controller/home_controller.dart';
import 'package:abu_s_application7/presentation/product_detail/controller/product_detail_controller.dart';
import 'package:abu_s_application7/presentation/search_page/controller/search_controller.dart';
import 'package:abu_s_application7/presentation/seller_pannel/seller_detail/controller/seller_controller.dart';
import 'package:abu_s_application7/presentation/seller_pannel/seller_screens/add_new_seller/controller/seller_detail_controller.dart';
import 'package:abu_s_application7/presentation/settings_screen/controller/settings_controller.dart';
import 'package:abu_s_application7/presentation/user_cart_products/controller/user_cart_controller.dart';
import 'package:flutter/material.dart';

import '../forgot_password_screen/controller/forgot_password_controller.dart';
import '../search/controller/custom_search-controller.dart';

class BottomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(() => BottomBarController());
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<SellerDetailController>(() => SellerDetailController());
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
    Get.lazyPut<UserCartController>(() => UserCartController());
    Get.lazyPut<SellerPannelController>(() => SellerPannelController());
    Get.lazyPut<CustomSearchController>(() => CustomSearchController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LocationSearchController>(() => LocationSearchController());

    // TODO: implement dependencies
  }
}
