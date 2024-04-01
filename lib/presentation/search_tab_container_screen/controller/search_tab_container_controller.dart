import '../../../core/app_export.dart';
import '../../../presentation/search_tab_container_screen/models/search_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SearchTabContainerScreen.
///
/// This class manages the state of the SearchTabContainerScreen, including the
/// current searchTabContainerModelObj
class SearchTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  Rx<SearchTabContainerModel> searchTabContainerModelObj =
      SearchTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 4));

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
