import 'package:abu_s_application7/presentation/product_detail/model/cart_model.dart';

class PlaceOrderModel {
  CartModel cartModel;
  String totalPrice;
  String address;
  String sellerId;
  String userId;

  PlaceOrderModel({
    required this.userId,
    required this.cartModel,
    required this.totalPrice,
    required this.address,
    required this.sellerId,
  });

  factory PlaceOrderModel.fromJson(Map<String, dynamic> json) {
    return PlaceOrderModel(
        cartModel: CartModel.fromJson(json['cartModel']),
        totalPrice: json['totalPrice'],
        address: json['address'],
        userId: json['userId'],
        sellerId: json['sellerId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'cartModel': cartModel.toJson(),
      'totalPrice': totalPrice,
      'address': address,
      'sellerId': sellerId,
      'userId': userId
    };
  }
}
