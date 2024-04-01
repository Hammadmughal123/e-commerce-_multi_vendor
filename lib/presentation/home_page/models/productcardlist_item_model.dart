import '../../../core/app_export.dart';

/// This class is used in the [productcardlist_item_widget] screen.
class ProductcardlistItemModel {
  ProductcardlistItemModel({
    this.image,
    this.subImage,
    this.title,
    this.startingText,
    this.price,
    this.id,
  }) {
    image = image ?? Rx(ImageConstant.imgRectangle1223);
    subImage = subImage ?? Rx(ImageConstant.imgImage);
    title = title ?? Rx("Fast food");
    startingText = startingText ?? Rx("Starting ");
    price = price ?? Rx("70");
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? subImage;

  Rx<String>? title;

  Rx<String>? startingText;

  Rx<String>? price;

  Rx<String>? id;
}
