import '../controller/log_in_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LogInScreen.
///
/// This class ensures that the LogInController is created when the
/// LogInScreen is first loaded.
class LogInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInController());
  }
}
