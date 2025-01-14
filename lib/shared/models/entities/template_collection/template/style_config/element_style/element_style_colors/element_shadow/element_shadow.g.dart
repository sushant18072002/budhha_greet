// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_shadow.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ElementShadowAdapter extends TypeAdapter<ElementShadow> {
  @override
  final int typeId = 96;

  @override
  ElementShadow read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ElementShadow(
      color: fields[0] as String,
      offset: fields[1] as ShadowOffset,
      blurRadius: fields[2] as double,
      opacity: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ElementShadow obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.offset)
      ..writeByte(2)
      ..write(obj.blurRadius)
      ..writeByte(3)
      ..write(obj.opacity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ElementShadowAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementShadow _$ElementShadowFromJson(Map<String, dynamic> json) =>
    ElementShadow(
      color: json['color'] as String,
      offset: ShadowOffset.fromJson(json['offset'] as Map<String, dynamic>),
      blurRadius: (json['blur_radius'] as num).toDouble(),
      opacity: (json['opacity'] as num).toDouble(),
    );

Map<String, dynamic> _$ElementShadowToJson(ElementShadow instance) =>
    <String, dynamic>{
      'color': instance.color,
      'offset': instance.offset,
      'blur_radius': instance.blurRadius,
      'opacity': instance.opacity,
    };
