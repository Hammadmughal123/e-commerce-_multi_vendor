import '../controller/message_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MessageScreen.
///
/// This class ensures that the MessageController is created when the
/// MessageScreen is first loaded.
class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
  }
}
