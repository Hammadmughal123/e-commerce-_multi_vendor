import '../controller/store_view_two_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StoreViewTwoTabContainerScreen.
///
/// This class ensures that the StoreViewTwoTabContainerController is created when the
/// StoreViewTwoTabContainerScreen is first loaded.
class StoreViewTwoTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreViewTwoTabContainerController());
  }
}
