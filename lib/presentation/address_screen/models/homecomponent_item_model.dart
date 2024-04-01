import '../../../core/app_export.dart';

/// This class is used in the [homecomponent_item_widget] screen.
class HomecomponentItemModel {
  HomecomponentItemModel({
    this.homeIcon,
    this.homeText,
    this.addressText,
    this.id,
  }) {
    homeIcon = homeIcon ?? Rx(ImageConstant.imgHome);
    homeText = homeText ?? Rx("Home");
    addressText = addressText ?? Rx("2464 Royal Ln. Mesa, New Jersey 45463");
    id = id ?? Rx("");
  }

  Rx<String>? homeIcon;

  Rx<String>? homeText;

  Rx<String>? addressText;

  Rx<String>? id;
}
