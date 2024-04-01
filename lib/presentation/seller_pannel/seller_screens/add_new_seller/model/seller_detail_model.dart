class SellerDetailModel {
  List<String>? sellerShopImages;
  String? storeName;
  String? storeEmail;
  String? sellerNumber;
  String? sellerBio;
  String? storeAddress;

  String? selectedChip;
  String? key;

  SellerDetailModel({
    this.key,
    this.sellerShopImages,
    this.storeName,
    this.storeEmail,
    this.sellerNumber,
    this.sellerBio,
    this.storeAddress,
    this.selectedChip,
  });

  factory SellerDetailModel.fromJson(Map<String, dynamic> json) {
    return SellerDetailModel(
      sellerShopImages: json['sellerShopImages'] != null
          ? List<String>.from(json['sellerShopImages'])
          : null,
      key: json['key'],
      storeName: json['storeName'],
      storeEmail: json['storeEmail'],
      sellerNumber: json['sellerNumber'],
      sellerBio: json['sellerBio'],
      storeAddress: json['storeAddress'],
      selectedChip: json['selectedChip'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sellerShopImages'] = sellerShopImages;
    data['key'] = key;
    data['storeName'] = storeName;
    data['storeEmail'] = storeEmail;
    data['sellerNumber'] = sellerNumber;
    data['sellerBio'] = sellerBio;
    data['storeAddress'] = storeAddress;
    data['selectedChip'] = selectedChip;
    return data;
  }
}
