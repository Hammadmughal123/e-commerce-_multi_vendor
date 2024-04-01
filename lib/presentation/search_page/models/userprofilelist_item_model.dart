import '../../../core/app_export.dart';

/// This class is used in the [userprofilelist_item_widget] screen.
class UserprofilelistItemModel {
  UserprofilelistItemModel({
    this.userImage,
    this.userName,
    this.userDescription,
    this.id,
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgImage84x122);
    userName = userName ?? Rx("european Shirt");
    userDescription = userDescription ?? Rx("Busy Cloth centre");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? userName;

  Rx<String>? userDescription;

  Rx<String>? id;
}
