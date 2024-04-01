import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/seller_pannel/seller_detail/controller/seller_controller.dart';

class SellerPannelBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SellerPannelController>(() => SellerPannelController());
  }
}
