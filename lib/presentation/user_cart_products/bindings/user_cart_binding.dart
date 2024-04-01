import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/user_cart_products/controller/user_cart_controller.dart';

class UserCartBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<UserCartController>(() => UserCartController());
  }
}
