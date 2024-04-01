// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SellerCartModelAdapter extends TypeAdapter<SellerCartModel> {
  @override
  final int typeId = 0;

  @override
  SellerCartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SellerCartModel(
      productImage: (fields[0] as List?)?.cast<String>(),
      numberOfProducts: fields[2] as String?,
      totalPrice: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SellerCartModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.productImage)
      ..writeByte(1)
      ..write(obj.totalPrice)
      ..writeByte(2)
      ..write(obj.numberOfProducts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SellerCartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
