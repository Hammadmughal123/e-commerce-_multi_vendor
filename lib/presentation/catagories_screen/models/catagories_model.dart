import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import 'productdetails_item_model.dart';

/// This class defines the variables used in the [catagories_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CatagoriesModel {
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

  Rx<List<ProductdetailsItemModel>> productdetailsItemList = Rx([
    ProductdetailsItemModel(
        image: ImageConstant.imgImage2.obs,
        title: "Burger Bistro".obs,
        description: "Rose garden".obs,
        price: "40".obs),
    ProductdetailsItemModel(
        image: ImageConstant.imgImage3.obs,
        title: "Smokin' Burger".obs,
        description: "Cafenio Restaurant".obs,
        price: "60".obs),
    ProductdetailsItemModel(
        image: ImageConstant.imgImage3.obs,
        title: "Buffalo Burgers".obs,
        description: "Kaji Firm Kitchen".obs,
        price: "75".obs),
    ProductdetailsItemModel(
        image: ImageConstant.imgImage4.obs,
        title: "Bullseye Burgers".obs,
        description: "Kabab restaurant".obs,
        price: "94".obs)
  ]);
}
