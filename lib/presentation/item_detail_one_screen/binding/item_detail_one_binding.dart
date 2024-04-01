import '../controller/item_detail_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ItemDetailOneScreen.
///
/// This class ensures that the ItemDetailOneController is created when the
/// ItemDetailOneScreen is first loaded.
class ItemDetailOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemDetailOneController());
  }
}
