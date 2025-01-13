// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shadow.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShadowAdapter extends TypeAdapter<Shadow> {
  @override
  final int typeId = 205;

  @override
  Shadow read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Shadow(
      color: fields[0] as String,
      offset: fields[1] as Offset,
      blurRadius: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Shadow obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.offset)
      ..writeByte(2)
      ..write(obj.blurRadius);
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
      offset: Offset.fromJson(json['offset'] as Map<String, dynamic>),
      blurRadius: (json['blurRadius'] as num).toDouble(),
    );

Map<String, dynamic> _$ShadowToJson(Shadow instance) => <String, dynamic>{
      'color': instance.color,
      'offset': instance.offset,
      'blurRadius': instance.blurRadius,
    };
