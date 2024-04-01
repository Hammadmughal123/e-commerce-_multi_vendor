import '../controller/location_access_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LocationAccessScreen.
///
/// This class ensures that the LocationAccessController is created when the
/// LocationAccessScreen is first loaded.
class LocationAccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationAccessController());
  }
}
