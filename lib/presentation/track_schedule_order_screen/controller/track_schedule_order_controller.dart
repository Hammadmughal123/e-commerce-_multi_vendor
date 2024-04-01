import '../../../core/app_export.dart';
import '../../../presentation/track_schedule_order_screen/models/track_schedule_order_model.dart';

/// A controller class for the TrackScheduleOrderScreen.
///
/// This class manages the state of the TrackScheduleOrderScreen, including the
/// current trackScheduleOrderModelObj
class TrackScheduleOrderController extends GetxController {
  Rx<TrackScheduleOrderModel> trackScheduleOrderModelObj =
      TrackScheduleOrderModel().obs;
}
