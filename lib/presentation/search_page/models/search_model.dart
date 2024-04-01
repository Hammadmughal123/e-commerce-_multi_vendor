import '../../../core/app_export.dart';
import 'restaurantcardlist_item_model.dart';
import 'userprofilelist_item_model.dart';

/// This class defines the variables used in the [search_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SearchModel {
  Rx<List<RestaurantcardlistItemModel>> restaurantcardlistItemList = Rx([
    RestaurantcardlistItemModel(
        image: ImageConstant.imgGroup8198.obs,
        restaurantName: "Pansi Restaurant".obs,
        ratingImage: ImageConstant.imgStar115x15.obs,
        ratingText: "4.7".obs),
    RestaurantcardlistItemModel(
        image: ImageConstant.imgMaskGroup.obs,
        restaurantName: "American General Store".obs,
        ratingImage: ImageConstant.imgStar11.obs,
        ratingText: "4.3".obs),
    RestaurantcardlistItemModel(
        image: ImageConstant.imgMaskGroup50x60.obs,
        restaurantName: "Electronic Store".obs,
        ratingImage: ImageConstant.imgStar12.obs,
        ratingText: "4.0".obs)
  ]);

  Rx<List<UserprofilelistItemModel>> userprofilelistItemList = Rx([
    UserprofilelistItemModel(
        userImage: ImageConstant.imgImage84x122.obs,
        userName: "european Shirt".obs,
        userDescription: "Busy Cloth centre".obs),
    UserprofilelistItemModel(
        userImage: ImageConstant.imgImage1.obs,
        userName: "mobile accessories".obs,
        userDescription: "Electronic Store".obs)
  ]);
}
