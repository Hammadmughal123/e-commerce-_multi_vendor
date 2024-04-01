import 'dart:convert';

class ProductModel {
  List<String>? productsImage;
  String? selectedCategory;
  String? productDetail;
  String? vendorId;
  int? stock;
  String? totalPrice;
  String? salePrice;
  String? currency;
  String? condition;
  String? productDescription;
  String? productKey;

  ProductModel({
    this.productsImage,
    this.productKey,
    this.selectedCategory,
    this.productDetail,
    this.stock,
    this.vendorId,
    this.totalPrice,
    this.salePrice,
    this.currency,
    this.condition,
    this.productDescription,
  });

  // Convert ProductModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'productsImage': productsImage,
      'selectedCategory': selectedCategory,
      'productDetail': productDetail,
      'stock': stock,
      'productKey': productKey,
      'totalPrice': totalPrice,
      'salePrice': salePrice,
      'currency': currency,
      'condition': condition,
      'productDescription': productDescription,
      'vendorId': vendorId,
    };
  }

  // Create ProductModel instance from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productsImage: json['productsImage'] != null
          ? List<String>.from(json['productsImage'])
          : null,
      selectedCategory: json['selectedCategory'],
      productDetail: json['productDetail'],
      stock: json['stock'],
      totalPrice: json['totalPrice'],
      salePrice: json['salePrice'],
      currency: json['currency'],
      condition: json['condition'],
      productKey: json['productKey'],
      productDescription: json['productDescription'],
      vendorId: json['vendorId'],
    );
  }
}

// Example of usage:

