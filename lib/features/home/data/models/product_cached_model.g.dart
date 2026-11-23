// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_cached_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCachedModelAdapter extends TypeAdapter<ProductCachedModel> {
  @override
  final typeId = 1;

  @override
  ProductCachedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCachedModel(fields[0] as List<ProductHiveModel>);
  }

  @override
  void write(BinaryWriter writer, ProductCachedModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCachedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
