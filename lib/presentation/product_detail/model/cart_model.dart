import '../../seller_pannel/add_category/model/product_model.dart';

class CartModel {
  String? numberOfProducts;
  String? totalPrice;
  ProductModel? productModel;
  String? vendorId;

  CartModel(
      {this.numberOfProducts,
      this.totalPrice,
      this.productModel,
      this.vendorId,});

  // Convert CartModel to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numberOfProducts'] = this.numberOfProducts;
    data['totalPrice'] = this.totalPrice;
    data['vendorID'] = this.vendorId;
    if (this.productModel != null) {
      data['productModel'] = this.productModel!.toJson();
    }
    return data;
  }

  // Convert JSON to CartModel
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      numberOfProducts: json['numberOfProducts'],
      totalPrice: json['totalPrice'],
      vendorId: json['vendorId'],
      productModel: json['productModel'] != null
          ? ProductModel.fromJson(json['productModel'])
          : null,
    );
  }
}
