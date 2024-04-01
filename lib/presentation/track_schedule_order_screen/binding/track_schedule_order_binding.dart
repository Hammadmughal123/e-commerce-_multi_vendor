import '../controller/track_schedule_order_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TrackScheduleOrderScreen.
///
/// This class ensures that the TrackScheduleOrderController is created when the
/// TrackScheduleOrderScreen is first loaded.
class TrackScheduleOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackScheduleOrderController());
  }
}
