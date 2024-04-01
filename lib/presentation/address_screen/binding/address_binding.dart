import '../controller/address_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddressScreen.
///
/// This class ensures that the AddressController is created when the
/// AddressScreen is first loaded.
class AddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController());
  }
}
