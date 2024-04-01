import '../controller/orders_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OrdersContainerScreen.
///
/// This class ensures that the OrdersContainerController is created when the
/// OrdersContainerScreen is first loaded.
class OrdersContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersContainerController());
  }
}
