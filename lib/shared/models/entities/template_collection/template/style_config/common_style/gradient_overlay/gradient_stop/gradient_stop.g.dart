// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_stop.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GradientStopAdapter extends TypeAdapter<GradientStop> {
  @override
  final int typeId = 90;

  @override
  GradientStop read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GradientStop(
      color: fields[0] as String,
      position: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GradientStop obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.position);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GradientStopAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GradientStop _$GradientStopFromJson(Map<String, dynamic> json) => GradientStop(
      color: json['color'] as String,
      position: (json['position'] as num).toDouble(),
    );

Map<String, dynamic> _$GradientStopToJson(GradientStop instance) =>
    <String, dynamic>{
      'color': instance.color,
      'position': instance.position,
    };
