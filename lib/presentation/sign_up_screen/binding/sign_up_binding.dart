import '../controller/sign_up_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SignUpScreen.
///
/// This class ensures that the SignUpController is created when the
/// SignUpScreen is first loaded.
class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
