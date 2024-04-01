import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/store_detail_page/controller/store_detail_controller.dart';

class StoreDetailBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<StoreDetailController>(() => StoreDetailController());
  }
}
