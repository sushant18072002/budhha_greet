// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_position.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutPositionAdapter extends TypeAdapter<LayoutPosition> {
  @override
  final int typeId = 35;

  @override
  LayoutPosition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutPosition(
      x: fields[0] as double,
      y: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutPosition obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.x)
      ..writeByte(1)
      ..write(obj.y);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutPositionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutPosition _$LayoutPositionFromJson(Map<String, dynamic> json) =>
    LayoutPosition(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$LayoutPositionToJson(LayoutPosition instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
