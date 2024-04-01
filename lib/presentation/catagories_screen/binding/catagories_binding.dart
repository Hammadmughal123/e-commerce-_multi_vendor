import '../controller/catagories_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CatagoriesScreen.
///
/// This class ensures that the CatagoriesController is created when the
/// CatagoriesScreen is first loaded.
class CatagoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CatagoriesController());
  }
}
