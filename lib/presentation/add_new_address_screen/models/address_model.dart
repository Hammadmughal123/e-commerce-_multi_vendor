class AddressModel {
  String? addressName;
  String? type;
  String? userId;

  AddressModel({this.addressName, this.type, this.userId});

  // Convert AddressModel object to a Map for JSON encoding
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressName'] = this.addressName;
    data['type'] = this.type;
    data['userId'] = this.userId;
    return data;
  }

  // Create an AddressModel object from a JSON map
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      addressName: json['addressName'],
      type: json['type'],
      userId: json['userId'],
    );
  }
}
