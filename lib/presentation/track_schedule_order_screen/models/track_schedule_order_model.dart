import '../../../core/app_export.dart';
import 'tracklist_item_model.dart';

/// This class defines the variables used in the [track_schedule_order_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TrackScheduleOrderModel {
  Rx<List<TracklistItemModel>> tracklistItemList = Rx([
    TracklistItemModel(
        numberText: "14".obs,
        monthText: "December 2016".obs,
        dayText: "Monday".obs,
        trackImage: ImageConstant.imgRectangle122349x56.obs)
  ]);
}
