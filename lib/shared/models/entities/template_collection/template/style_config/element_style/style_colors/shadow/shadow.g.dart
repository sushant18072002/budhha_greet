// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shadow.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShadowAdapter extends TypeAdapter<Shadow> {
  @override
  final int typeId = 96;

  @override
  Shadow read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Shadow(
      color: fields[0] as String,
      offset: fields[1] as Position,
      blurRadius: fields[2] as double,
      opacity: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Shadow obj) {
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
      other is ShadowAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shadow _$ShadowFromJson(Map<String, dynamic> json) => Shadow(
      color: json['color'] as String,
      offset: Position.fromJson(json['offset'] as Map<String, dynamic>),
      blurRadius: (json['blur_radius'] as num).toDouble(),
      opacity: (json['opacity'] as num).toDouble(),
    );

Map<String, dynamic> _$ShadowToJson(Shadow instance) => <String, dynamic>{
      'color': instance.color,
      'offset': instance.offset,
      'blur_radius': instance.blurRadius,
      'opacity': instance.opacity,
    };
