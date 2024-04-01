import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/seller_pannel/add_category/controller/add_category_controller.dart';

class AddCartegoryBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AddCategoryController>(() => AddCategoryController());
  }
}
