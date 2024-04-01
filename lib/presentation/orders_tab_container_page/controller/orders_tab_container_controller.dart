import '../../../core/app_export.dart';
import '../../../presentation/orders_tab_container_page/models/orders_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the OrdersTabContainerPage.
///
/// This class manages the state of the OrdersTabContainerPage, including the
/// current ordersTabContainerModelObj
class OrdersTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  OrdersTabContainerController(this.ordersTabContainerModelObj);

  Rx<OrdersTabContainerModel> ordersTabContainerModelObj;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
