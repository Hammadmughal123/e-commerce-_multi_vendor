import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/complete_profile/controller/profile_controller.dart';

class CompleteProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CompleteProfileController>(() => CompleteProfileController());
  }
}
