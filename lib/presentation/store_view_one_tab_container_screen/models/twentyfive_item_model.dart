import '../../../core/app_export.dart';

/// This class is used in the [twentyfive_item_widget] screen.
class TwentyfiveItemModel {
  TwentyfiveItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
