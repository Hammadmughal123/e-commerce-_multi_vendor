import 'controller/orders_container_controller.dart';
import '../../core/app_export.dart';
import '../../presentation/home_page/home_page.dart';
import '../../presentation/orders_tab_container_page/orders_tab_container_page.dart';
import '../../presentation/pickup_page/pickup_page.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class OrdersContainerScreen extends GetWidget<OrdersContainerController> {
  const OrdersContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.ordersTabContainerPage,
          onGenerateRoute: (routeSetting) => GetPageRoute(
              page: () => getCurrentPage(routeSetting.name!),
              transition: Transition.noTransition)),
      // bottomNavigationBar: _buildBottomBar()
    ));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
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
