import 'package:abu_s_application7/presentation/my_cart_screen/models/place_order_model.dart';
import 'package:abu_s_application7/presentation/product_detail/model/cart_model.dart';

class ScheduleOrderModel {
  CartModel model;
  String date;
  String time;
  String originalamount;
  String numberOfProducts;
  String address;
  String sellerId;

  ScheduleOrderModel({
    required this.model,
    required this.date,
    required this.time,
    required this.address,
    required this.numberOfProducts,
    required this.originalamount,
    required this.sellerId,
  });

  Map<String, dynamic> toJson() {
    return {
      'model': model.toJson(),
      'date': date,
      'time': time,
      'originalamount': originalamount,
      'numberOfProducts': numberOfProducts,
      'address': address,
      'sellerId': sellerId,
    };
  }

  factory ScheduleOrderModel.fromJson(Map<String, dynamic> json) {
    return ScheduleOrderModel(
      model: CartModel.fromJson(json['model']),
      date: json['date'],
      time: json['time'],
      originalamount: json['originalamount'],
      numberOfProducts: json['numberOfProducts'],
      address: json['address'],
      sellerId: json['sellerId'],
    );
  }
}
