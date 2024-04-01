import '../../../core/app_export.dart';
import '../../../presentation/message_screen/models/message_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the MessageScreen.
///
/// This class manages the state of the MessageScreen, including the
/// current messageModelObj
class MessageController extends GetxController {
  TextEditingController messageFiveController = TextEditingController();

  TextEditingController messageSevenController = TextEditingController();

  Rx<MessageModel> messageModelObj = MessageModel().obs;

  @override
  void onClose() {
    super.onClose();
    messageFiveController.dispose();
    messageSevenController.dispose();
  }
}
