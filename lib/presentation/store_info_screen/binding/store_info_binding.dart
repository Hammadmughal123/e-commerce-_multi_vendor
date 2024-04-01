import '../controller/store_info_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PersonalProfilesScreen.
///
/// This class ensures that the PersonalProfilesController is created when the
/// PersonalProfilesScreen is first loaded.
class StoreInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreInfoController());
  }
}
