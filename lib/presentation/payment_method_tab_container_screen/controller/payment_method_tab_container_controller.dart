import '../../../core/app_export.dart';
import '../../../presentation/payment_method_tab_container_screen/models/payment_method_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PaymentMethodTabContainerScreen.
///
/// This class manages the state of the PaymentMethodTabContainerScreen, including the
/// current paymentMethodTabContainerModelObj
class PaymentMethodTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<PaymentMethodTabContainerModel> paymentMethodTabContainerModelObj =
      PaymentMethodTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 4));
}
