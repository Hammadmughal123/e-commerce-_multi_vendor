import '../../../core/app_export.dart';

/// This class is used in the [burger01_item_widget] screen.
class Burger01ItemModel {
  Burger01ItemModel({
    this.burgerName,
    this.restaurantName,
    this.price,
    this.id,
  }) {
    burgerName = burgerName ?? Rx("Burger Ferguson");
    restaurantName = restaurantName ?? Rx("Spicy restaurant");
    price = price ?? Rx("40");
    id = id ?? Rx("");
  }

  Rx<String>? burgerName;

  Rx<String>? restaurantName;

  Rx<String>? price;

  Rx<String>? id;
}
