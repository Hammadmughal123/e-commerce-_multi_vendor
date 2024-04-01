import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/seller_pannel/seller_screens/add_new_seller/controller/seller_detail_controller.dart';

class SellerDetailBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SellerDetailController>(() => SellerDetailController());
  }
}