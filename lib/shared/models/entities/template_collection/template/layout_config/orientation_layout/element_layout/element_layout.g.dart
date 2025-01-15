// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_layout.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ElementLayoutAdapter extends TypeAdapter<ElementLayout> {
  @override
  final int typeId = 34;

  @override
  ElementLayout read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ElementLayout(
      layoutPosition: fields[0] as LayoutPosition,
      size: fields[1] as LayoutSize,
      padding: fields[2] as double?,
      safeArea: fields[3] as LayoutSafeArea?,
      visualEffects: fields[4] as LayoutVisualEffects?,
    );
  }

  @override
  void write(BinaryWriter writer, ElementLayout obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.layoutPosition)
      ..writeByte(1)
      ..write(obj.size)
      ..writeByte(2)
      ..write(obj.padding)
      ..writeByte(3)
      ..write(obj.safeArea)
      ..writeByte(4)
      ..write(obj.visualEffects);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ElementLayoutAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementLayout _$ElementLayoutFromJson(Map<String, dynamic> json) =>
    ElementLayout(
      layoutPosition:
          LayoutPosition.fromJson(json['position'] as Map<String, dynamic>),
      size: LayoutSize.fromJson(json['size'] as Map<String, dynamic>),
      padding: (json['padding'] as num?)?.toDouble(),
      safeArea: json['safe_area'] == null
          ? null
          : LayoutSafeArea.fromJson(json['safe_area'] as Map<String, dynamic>),
      visualEffects: json['visual_effects'] == null
          ? null
          : LayoutVisualEffects.fromJson(
              json['visual_effects'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElementLayoutToJson(ElementLayout instance) =>
    <String, dynamic>{
      'position': instance.layoutPosition,
      'size': instance.size,
      'padding': instance.padding,
      'safe_area': instance.safeArea,
      'visual_effects': instance.visualEffects,
    };
