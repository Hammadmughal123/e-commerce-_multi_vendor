import '../../../core/app_export.dart';
import 'burger01_item_model.dart';

/// This class defines the variables used in the [store_view_one_page],
/// and is typically used to hold data that is passed between different parts of the application.
class StoreViewOneModel {
  Rx<List<Burger01ItemModel>> burger01ItemList = Rx([
    Burger01ItemModel(
        burgerName: "Burger Ferguson".obs,
        restaurantName: "Spicy restaurant".obs,
        price: "40".obs),
    Burger01ItemModel(
        burgerName: "Rockin' Burgers".obs,
        restaurantName: "Cafecafachino".obs,
        price: "40".obs)
  ]);
}
