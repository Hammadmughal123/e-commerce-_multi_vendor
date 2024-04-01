import '../controller/add_new_card_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddNewCardScreen.
///
/// This class ensures that the AddNewCardController is created when the
/// AddNewCardScreen is first loaded.
class AddNewCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewCardController());
  }
}
