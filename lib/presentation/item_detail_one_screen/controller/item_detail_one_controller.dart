import '../../../core/app_export.dart';
import '../../../presentation/item_detail_one_screen/models/item_detail_one_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

/// A controller class for the ItemDetailOneScreen.
///
/// This class manages the state of the ItemDetailOneScreen, including the
/// current itemDetailOneModelObj
class ItemDetailOneController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<ItemDetailOneModel> itemDetailOneModelObj = ItemDetailOneModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}
