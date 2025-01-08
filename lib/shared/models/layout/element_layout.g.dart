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
      position: fields[0] as Position,
      size: fields[1] as Size,
      padding: fields[2] as double,
      safeArea: fields[3] as SafeArea?,
    );
  }

  @override
  void write(BinaryWriter writer, ElementLayout obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.position)
      ..writeByte(1)
      ..write(obj.size)
      ..writeByte(2)
      ..write(obj.padding)
      ..writeByte(3)
      ..write(obj.safeArea);
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
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      size: Size.fromJson(json['size'] as Map<String, dynamic>),
      padding: (json['padding'] as num).toDouble(),
      safeArea: json['safeArea'] == null
          ? null
          : SafeArea.fromJson(json['safeArea'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElementLayoutToJson(ElementLayout instance) =>
    <String, dynamic>{
      'position': instance.position,
      'size': instance.size,
      'padding': instance.padding,
      'safeArea': instance.safeArea,
    };
