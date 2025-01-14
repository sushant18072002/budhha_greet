// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shadow_offset.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShadowOffsetAdapter extends TypeAdapter<ShadowOffset> {
  @override
  final int typeId = 35;

  @override
  ShadowOffset read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShadowOffset(
      x: fields[0] as double,
      y: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ShadowOffset obj) {
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
      other is ShadowOffsetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShadowOffset _$ShadowOffsetFromJson(Map<String, dynamic> json) => ShadowOffset(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$ShadowOffsetToJson(ShadowOffset instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
