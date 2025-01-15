// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_color_palette.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundColorPaletteAdapter
    extends TypeAdapter<BackgroundColorPalette> {
  @override
  final int typeId = 24;

  @override
  BackgroundColorPalette read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundColorPalette(
      light: fields[0] as String,
      dark: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundColorPalette obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.light)
      ..writeByte(1)
      ..write(obj.dark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundColorPaletteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundColorPalette _$BackgroundColorPaletteFromJson(
        Map<String, dynamic> json) =>
    BackgroundColorPalette(
      light: json['light'] as String,
      dark: json['dark'] as String,
    );

Map<String, dynamic> _$BackgroundColorPaletteToJson(
        BackgroundColorPalette instance) =>
    <String, dynamic>{
      'light': instance.light,
      'dark': instance.dark,
    };
