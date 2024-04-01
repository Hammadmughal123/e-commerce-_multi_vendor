import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/seller_pannel/selller_cart_product/controller/seller_cart_controller.dart';

class SellerCartBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SellerCartController>(() => SellerCartController());
  }
}