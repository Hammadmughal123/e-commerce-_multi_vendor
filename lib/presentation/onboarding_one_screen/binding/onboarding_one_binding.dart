import '../controller/onboarding_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingOneScreen.
///
/// This class ensures that the OnboardingOneController is created when the
/// OnboardingOneScreen is first loaded.
class OnboardingOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingOneController());
  }
}
