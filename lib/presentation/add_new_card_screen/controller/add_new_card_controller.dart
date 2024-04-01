import '../../../core/app_export.dart';
import '../../../presentation/add_new_card_screen/models/add_new_card_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddNewCardScreen.
///
/// This class manages the state of the AddNewCardScreen, including the
/// current addNewCardModelObj
class AddNewCardController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController languageController = TextEditingController();

  Rx<AddNewCardModel> addNewCardModelObj = AddNewCardModel().obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    cardNumberController.dispose();
    languageController.dispose();
  }
}
