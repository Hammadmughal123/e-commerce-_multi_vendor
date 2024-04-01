import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/all_store/controllers/all_store_controller.dart';

class AllStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllStoreController>(() => AllStoreController());
  }
}
