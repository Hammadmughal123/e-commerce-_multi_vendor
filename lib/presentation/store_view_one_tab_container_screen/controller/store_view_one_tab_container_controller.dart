import '../../../core/app_export.dart';
import '../../../presentation/store_view_one_tab_container_screen/models/store_view_one_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the StoreViewOneTabContainerScreen.
///
/// This class manages the state of the StoreViewOneTabContainerScreen, including the
/// current storeViewOneTabContainerModelObj
class StoreViewOneTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<StoreViewOneTabContainerModel> storeViewOneTabContainerModelObj =
      StoreViewOneTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 4));

  Rx<int> sliderIndex = 0.obs;
}
