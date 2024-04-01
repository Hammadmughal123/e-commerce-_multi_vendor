import '../controller/store_view_one_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StoreViewOneTabContainerScreen.
///
/// This class ensures that the StoreViewOneTabContainerController is created when the
/// StoreViewOneTabContainerScreen is first loaded.
class StoreViewOneTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreViewOneTabContainerController());
  }
}
