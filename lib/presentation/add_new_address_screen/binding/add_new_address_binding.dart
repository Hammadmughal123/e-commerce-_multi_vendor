import '../controller/add_new_address_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddNewAddressScreen.
///
/// This class ensures that the AddNewAddressController is created when the
/// AddNewAddressScreen is first loaded.
class AddNewAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewAddressController>(() => AddNewAddressController());
  }
}
