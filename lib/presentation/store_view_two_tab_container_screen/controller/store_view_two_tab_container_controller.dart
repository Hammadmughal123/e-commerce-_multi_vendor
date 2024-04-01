import '../../../core/app_export.dart';
import '../../../presentation/store_view_two_tab_container_screen/models/store_view_two_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the StoreViewTwoTabContainerScreen.
///
/// This class manages the state of the StoreViewTwoTabContainerScreen, including the
/// current storeViewTwoTabContainerModelObj
class StoreViewTwoTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<StoreViewTwoTabContainerModel> storeViewTwoTabContainerModelObj =
      StoreViewTwoTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 4));

  Rx<int> sliderIndex = 0.obs;
}
