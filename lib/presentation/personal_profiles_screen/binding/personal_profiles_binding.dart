import '../controller/personal_profiles_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PersonalProfilesScreen.
///
/// This class ensures that the PersonalProfilesController is created when the
/// PersonalProfilesScreen is first loaded.
class PersonalProfilesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalProfilesController());
  }
}
