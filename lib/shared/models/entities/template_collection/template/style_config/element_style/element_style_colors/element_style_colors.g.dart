// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_style_colors.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ElementStyleColorsAdapter extends TypeAdapter<ElementStyleColors> {
  @override
  final int typeId = 95;

  @override
  ElementStyleColors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ElementStyleColors(
      text: fields[0] as String,
      shadow: fields[1] as ElementShadow,
    );
  }

  @override
  void write(BinaryWriter writer, ElementStyleColors obj) {
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
      other is ElementStyleColorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementStyleColors _$ElementStyleColorsFromJson(Map<String, dynamic> json) =>
    ElementStyleColors(
      text: json['text'] as String,
      shadow: ElementShadow.fromJson(json['shadow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElementStyleColorsToJson(ElementStyleColors instance) =>
    <String, dynamic>{
      'text': instance.text,
      'shadow': instance.shadow,
    };
