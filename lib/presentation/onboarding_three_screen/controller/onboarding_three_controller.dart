import '../../../core/app_export.dart';
import '../../../presentation/onboarding_three_screen/models/onboarding_three_model.dart';

/// A controller class for the OnboardingThreeScreen.
///
/// This class manages the state of the OnboardingThreeScreen, including the
/// current onboardingThreeModelObj
class OnboardingThreeController extends GetxController {
  Rx<OnboardingThreeModel> onboardingThreeModelObj = OnboardingThreeModel().obs;
}
