import '../../../core/app_export.dart';
import '../../../presentation/edit_cart_screen/models/edit_cart_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the EditCartScreen.
///
/// This class manages the state of the EditCartScreen, including the
/// current editCartModelObj
class EditCartController extends GetxController {
  TextEditingController addressController = TextEditingController();

  Rx<EditCartModel> editCartModelObj = EditCartModel().obs;

  @override
  void onClose() {
    super.onClose();
    addressController.dispose();
  }
}
