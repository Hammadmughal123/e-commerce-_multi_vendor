import '../controller/my_cart_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MyCartScreen.
///
/// This class ensures that the MyCartController is created when the
/// MyCartScreen is first loaded.
class MyCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCartController());
  }
}
