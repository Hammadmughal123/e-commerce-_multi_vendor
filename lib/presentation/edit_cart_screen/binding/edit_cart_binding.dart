import '../controller/edit_cart_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditCartScreen.
///
/// This class ensures that the EditCartController is created when the
/// EditCartScreen is first loaded.
class EditCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditCartController());
  }
}
