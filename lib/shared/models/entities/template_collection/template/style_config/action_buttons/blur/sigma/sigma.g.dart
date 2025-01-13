// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigma.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SigmaAdapter extends TypeAdapter<Sigma> {
  @override
  final int typeId = 204;

  @override
  Sigma read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sigma(
      x: fields[0] as double,
      y: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Sigma obj) {
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
      other is SigmaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sigma _$SigmaFromJson(Map<String, dynamic> json) => Sigma(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$SigmaToJson(Sigma instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
