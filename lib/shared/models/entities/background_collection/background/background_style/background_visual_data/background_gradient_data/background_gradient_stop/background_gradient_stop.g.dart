// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_gradient_stop.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundGradientStopAdapter
    extends TypeAdapter<BackgroundGradientStop> {
  @override
  final int typeId = 22;

  @override
  BackgroundGradientStop read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundGradientStop(
      position: fields[0] as double,
      color: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundGradientStop obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.position)
      ..writeByte(1)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundGradientStopAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundGradientStop _$BackgroundGradientStopFromJson(
        Map<String, dynamic> json) =>
    BackgroundGradientStop(
      position: (json['position'] as num).toDouble(),
      color: json['color'] as String,
    );

Map<String, dynamic> _$BackgroundGradientStopToJson(
        BackgroundGradientStop instance) =>
    <String, dynamic>{
      'position': instance.position,
      'color': instance.color,
    };
