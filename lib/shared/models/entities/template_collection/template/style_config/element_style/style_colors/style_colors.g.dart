// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'style_colors.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StyleColorsAdapter extends TypeAdapter<StyleColors> {
  @override
  final int typeId = 95;

  @override
  StyleColors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StyleColors(
      text: fields[0] as String,
      shadow: fields[1] as Shadow,
    );
  }

  @override
  void write(BinaryWriter writer, StyleColors obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.shadow);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StyleColorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StyleColors _$StyleColorsFromJson(Map<String, dynamic> json) => StyleColors(
      text: json['text'] as String,
      shadow: Shadow.fromJson(json['shadow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StyleColorsToJson(StyleColors instance) =>
    <String, dynamic>{
      'text': instance.text,
      'shadow': instance.shadow,
    };
