import '../controller/onboarding_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingTwoScreen.
///
/// This class ensures that the OnboardingTwoController is created when the
/// OnboardingTwoScreen is first loaded.
class OnboardingTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingTwoController());
  }
}
