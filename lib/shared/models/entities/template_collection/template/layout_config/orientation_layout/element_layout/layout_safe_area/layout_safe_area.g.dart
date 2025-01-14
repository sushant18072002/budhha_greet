// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_safe_area.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutSafeAreaAdapter extends TypeAdapter<LayoutSafeArea> {
  @override
  final int typeId = 37;

  @override
  LayoutSafeArea read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutSafeArea(
      top: fields[0] as double,
      bottom: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutSafeArea obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.top)
      ..writeByte(1)
      ..write(obj.bottom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutSafeAreaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutSafeArea _$LayoutSafeAreaFromJson(Map<String, dynamic> json) =>
    LayoutSafeArea(
      top: (json['top'] as num).toDouble(),
      bottom: (json['bottom'] as num).toDouble(),
    );

Map<String, dynamic> _$LayoutSafeAreaToJson(LayoutSafeArea instance) =>
    <String, dynamic>{
      'top': instance.top,
      'bottom': instance.bottom,
    };
