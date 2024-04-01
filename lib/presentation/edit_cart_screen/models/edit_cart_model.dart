import '../../../core/app_export.dart';
import 'foodcomponent_item_model.dart';

/// This class defines the variables used in the [edit_cart_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EditCartModel {
  Rx<List<FoodcomponentItemModel>> foodcomponentItemList = Rx([
    FoodcomponentItemModel(
        foodImage: ImageConstant.imgRectangle1223117x136.obs,
        foodName: "pizza calzone european".obs,
        foodPrice: "44".obs,
        foodSize: "14'’".obs,
        quantity: "2".obs),
    FoodcomponentItemModel(
        foodImage: ImageConstant.imgRectangle12231.obs,
        foodName: "european Oranges".obs,
        foodPrice: "32".obs,
        foodSize: "14'’".obs,
        quantity: "9".obs)
  ]);
}
