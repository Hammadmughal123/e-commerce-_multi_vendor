import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController
    with GetTickerProviderStateMixin {
   TabController? tabController;
  RxInt selectIndex = 0.obs;
  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  void changeIndex(int index) {
    selectIndex.value = index;
    tabController!.animateTo(index);
    update();
  }
}
