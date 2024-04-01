import '../../../core/app_export.dart';

/// This class is used in the [restaurantcardlist_item_widget] screen.
class RestaurantcardlistItemModel {
  RestaurantcardlistItemModel({
    this.image,
    this.restaurantName,
    this.ratingImage,
    this.ratingText,
    this.id,
  }) {
    image = image ?? Rx(ImageConstant.imgGroup8198);
    restaurantName = restaurantName ?? Rx("Pansi Restaurant");
    ratingImage = ratingImage ?? Rx(ImageConstant.imgStar115x15);
    ratingText = ratingText ?? Rx("4.7");
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? restaurantName;

  Rx<String>? ratingImage;

  Rx<String>? ratingText;

  Rx<String>? id;
}
