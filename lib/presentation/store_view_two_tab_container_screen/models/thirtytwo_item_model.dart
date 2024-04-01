import '../../../core/app_export.dart';

/// This class is used in the [thirtytwo_item_widget] screen.
class ThirtytwoItemModel {
  ThirtytwoItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
