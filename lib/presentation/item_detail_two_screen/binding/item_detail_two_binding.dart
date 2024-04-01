import '../controller/item_detail_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ItemDetailTwoScreen.
///
/// This class ensures that the ItemDetailTwoController is created when the
/// ItemDetailTwoScreen is first loaded.
class ItemDetailTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemDetailTwoController());
  }
}
