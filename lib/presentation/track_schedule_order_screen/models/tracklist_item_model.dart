import '../../../core/app_export.dart';

/// This class is used in the [tracklist_item_widget] screen.
class TracklistItemModel {
  TracklistItemModel({
    this.numberText,
    this.monthText,
    this.dayText,
    this.trackImage,
    this.id,
  }) {
    numberText = numberText ?? Rx("14");
    monthText = monthText ?? Rx("December 2016");
    dayText = dayText ?? Rx("Monday");
    trackImage = trackImage ?? Rx(ImageConstant.imgRectangle122349x56);
    id = id ?? Rx("");
  }

  Rx<String>? numberText;

  Rx<String>? monthText;

  Rx<String>? dayText;

  Rx<String>? trackImage;

  Rx<String>? id;
}
