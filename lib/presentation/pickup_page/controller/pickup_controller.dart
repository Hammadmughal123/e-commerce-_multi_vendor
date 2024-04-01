import '../../../core/app_export.dart';
import '../../../presentation/pickup_page/models/pickup_model.dart';

/// A controller class for the PickupPage.
///
/// This class manages the state of the PickupPage, including the
/// current pickupModelObj
class PickupController extends GetxController {
  PickupController(this.pickupModelObj);

  Rx<PickupModel> pickupModelObj;
}
