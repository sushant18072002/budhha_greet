// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'style.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StyleAdapter extends TypeAdapter<Style> {
  @override
  final int typeId = 11;

  @override
  Style read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Style(
      typography: fields[0] as Typography,
      colors: fields[1] as StyleColors,
    );
  }

  @override
  void write(BinaryWriter writer, Style obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.typography)
      ..writeByte(1)
      ..write(obj.colors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StyleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Style _$StyleFromJson(Map<String, dynamic> json) => Style(
      typography:
          Typography.fromJson(json['typography'] as Map<String, dynamic>),
      colors: StyleColors.fromJson(json['colors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StyleToJson(Style instance) => <String, dynamic>{
      'typography': instance.typography,
      'colors': instance.colors,
    };
