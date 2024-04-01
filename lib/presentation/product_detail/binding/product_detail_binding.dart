import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/product_detail/controller/product_detail_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
  }
}
