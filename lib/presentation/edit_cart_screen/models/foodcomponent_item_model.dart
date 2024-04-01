import '../../../core/app_export.dart';/// This class is used in the [foodcomponent_item_widget] screen.
class FoodcomponentItemModel {FoodcomponentItemModel({this.foodImage, this.foodName, this.foodPrice, this.foodSize, this.quantity, this.id, }) { foodImage = foodImage  ?? Rx(ImageConstant.imgRectangle1223117x136);foodName = foodName  ?? Rx("pizza calzone european");foodPrice = foodPrice  ?? Rx("44");foodSize = foodSize  ?? Rx("14'’");quantity = quantity  ?? Rx("2");id = id  ?? Rx(""); }

Rx<String>? foodImage;

Rx<String>? foodName;

Rx<String>? foodPrice;

Rx<String>? foodSize;

Rx<String>? quantity;

Rx<String>? id;

 }
