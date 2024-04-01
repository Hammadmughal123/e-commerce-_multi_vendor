import '../../../core/app_export.dart';
import '../../../presentation/tracking_order_bottomsheet/models/tracking_order_model.dart';

/// A controller class for the TrackingOrderBottomsheet.
///
/// This class manages the state of the TrackingOrderBottomsheet, including the
/// current trackingOrderModelObj
class TrackingOrderController extends GetxController {
  Rx<TrackingOrderModel> trackingOrderModelObj = TrackingOrderModel().obs;
}
