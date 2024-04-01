import '../controller/payment_successfull_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentSuccessfullScreen.
///
/// This class ensures that the PaymentSuccessfullController is created when the
/// PaymentSuccessfullScreen is first loaded.
class PaymentSuccessfullBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentSuccessfullController());
  }
}
