

import 'package:hive/hive.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class SellerCartModel {
  @HiveField(0)
  List<String>? productImage;
  @HiveField(1)
  String? totalPrice;
  @HiveField(2)
  String? numberOfProducts;

  SellerCartModel({this.productImage, this.numberOfProducts, this.totalPrice});
}
