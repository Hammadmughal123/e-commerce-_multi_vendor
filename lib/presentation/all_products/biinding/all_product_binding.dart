import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/all_products/controller/all_product_controller.dart';

class AllProductBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AllProductController>(() => AllProductController());
  }
}
