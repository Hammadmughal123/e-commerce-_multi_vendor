import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import 'productcardlist_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<ProductcardlistItemModel>> productcardlistItemList = Rx([
    ProductcardlistItemModel(
        image: ImageConstant.imgRectangle1223.obs,
        subImage: ImageConstant.imgImage.obs,
        title: "Fast food".obs,
        startingText: "Starting ".obs,
        price: "70".obs),
    ProductcardlistItemModel(
        image: ImageConstant.imgRectangle1223.obs,
        subImage: ImageConstant.imgImage104x122.obs,
        title: "Grocery".obs,
        startingText: "Starting ".obs,
        price: "50".obs)
  ]);
}
