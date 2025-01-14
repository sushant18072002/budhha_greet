// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_background.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutBackgroundAdapter extends TypeAdapter<LayoutBackground> {
  @override
  final int typeId = 84;

  @override
  LayoutBackground read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutBackground(
      opacity: fields[0] as LayoutOpacityConfig,
      color: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutBackground obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.opacity)
      ..writeByte(1)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutBackgroundAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutBackground _$LayoutBackgroundFromJson(Map<String, dynamic> json) =>
    LayoutBackground(
      opacity:
          LayoutOpacityConfig.fromJson(json['opacity'] as Map<String, dynamic>),
      color: json['color'] as String,
    );

Map<String, dynamic> _$LayoutBackgroundToJson(LayoutBackground instance) =>
    <String, dynamic>{
      'opacity': instance.opacity,
      'color': instance.color,
    };
