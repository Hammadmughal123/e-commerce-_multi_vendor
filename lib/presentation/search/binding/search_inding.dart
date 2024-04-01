import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/search_page/controller/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomSearchController>(() => CustomSearchController());
  }
}
