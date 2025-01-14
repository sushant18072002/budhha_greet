// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_style.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ElementStyleAdapter extends TypeAdapter<ElementStyle> {
  @override
  final int typeId = 117;

  @override
  ElementStyle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ElementStyle(
      typography: fields[0] as ElementTypography,
      colors: fields[1] as ElementStyleColors,
    );
  }

  @override
  void write(BinaryWriter writer, ElementStyle obj) {
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
      other is ElementStyleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementStyle _$ElementStyleFromJson(Map<String, dynamic> json) => ElementStyle(
      typography: ElementTypography.fromJson(
          json['typography'] as Map<String, dynamic>),
      colors:
          ElementStyleColors.fromJson(json['colors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElementStyleToJson(ElementStyle instance) =>
    <String, dynamic>{
      'typography': instance.typography,
      'colors': instance.colors,
    };
