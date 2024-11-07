// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_res_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomePageResModelAdapter extends TypeAdapter<HomePageResModel> {
  @override
  final int typeId = 1;

  @override
  HomePageResModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomePageResModel(
      success: fields[1] as bool?,
      products: (fields[2] as List?)?.cast<Product>(),
    );
  }

  @override
  void write(BinaryWriter writer, HomePageResModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.success)
      ..writeByte(2)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomePageResModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 2;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[1] as String?,
      name: fields[2] as String?,
      description: fields[3] as dynamic,
      stockStatus: fields[4] as String?,
      manufacturer: fields[5] as dynamic,
      quantity: fields[6] as String?,
      reviews: fields[7] as dynamic,
      price: fields[8] as String?,
      thumb: fields[9] as String?,
      special: fields[10] as bool?,
      rating: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.stockStatus)
      ..writeByte(5)
      ..write(obj.manufacturer)
      ..writeByte(6)
      ..write(obj.quantity)
      ..writeByte(7)
      ..write(obj.reviews)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.thumb)
      ..writeByte(10)
      ..write(obj.special)
      ..writeByte(11)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
