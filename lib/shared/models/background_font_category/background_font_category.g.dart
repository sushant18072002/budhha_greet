// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_font_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundFontCategoryAdapter
    extends TypeAdapter<BackgroundFontCategory> {
  @override
  final int typeId = 7;

  @override
  BackgroundFontCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundFontCategory(
      id: fields[0] as String,
      fonts: (fields[1] as List).cast<String>(),
      sizes: (fields[2] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundFontCategory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fonts)
      ..writeByte(2)
      ..write(obj.sizes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundFontCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
