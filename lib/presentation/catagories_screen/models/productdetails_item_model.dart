import '../../../core/app_export.dart';/// This class is used in the [productdetails_item_widget] screen.
class ProductdetailsItemModel {ProductdetailsItemModel({this.image, this.title, this.description, this.price, this.id, }) { image = image  ?? Rx(ImageConstant.imgImage2);title = title  ?? Rx("Burger Bistro");description = description  ?? Rx("Rose garden");price = price  ?? Rx("40");id = id  ?? Rx(""); }

Rx<String>? image;

Rx<String>? title;

Rx<String>? description;

Rx<String>? price;

Rx<String>? id;

 }
