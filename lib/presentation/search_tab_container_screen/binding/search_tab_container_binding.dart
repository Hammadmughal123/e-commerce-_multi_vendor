import '../controller/search_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SearchTabContainerScreen.
///
/// This class ensures that the SearchTabContainerController is created when the
/// SearchTabContainerScreen is first loaded.
class SearchTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchTabContainerController());
  }
}
