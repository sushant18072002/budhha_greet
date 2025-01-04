// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_font_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundFontConfigAdapter extends TypeAdapter<BackgroundFontConfig> {
  @override
  final int typeId = 8;

  @override
  BackgroundFontConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundFontConfig(
      categories: (fields[0] as List).cast<BackgroundFontCategory>(),
      effects: (fields[1] as List).cast<String>(),
      colors: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundFontConfig obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.categories)
      ..writeByte(1)
      ..write(obj.effects)
      ..writeByte(2)
      ..write(obj.colors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundFontConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
