import '../controller/payment_method_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentMethodTabContainerScreen.
///
/// This class ensures that the PaymentMethodTabContainerController is created when the
/// PaymentMethodTabContainerScreen is first loaded.
class PaymentMethodTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethodTabContainerController());
  }
}
