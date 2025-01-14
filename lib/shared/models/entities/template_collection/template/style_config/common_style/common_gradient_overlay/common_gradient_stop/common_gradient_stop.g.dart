// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_gradient_stop.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommonGradientStopAdapter extends TypeAdapter<CommonGradientStop> {
  @override
  final int typeId = 90;

  @override
  CommonGradientStop read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommonGradientStop(
      color: fields[0] as String,
      position: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CommonGradientStop obj) {
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
      other is CommonGradientStopAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonGradientStop _$CommonGradientStopFromJson(Map<String, dynamic> json) =>
    CommonGradientStop(
      color: json['color'] as String,
      position: (json['position'] as num).toDouble(),
    );

Map<String, dynamic> _$CommonGradientStopToJson(CommonGradientStop instance) =>
    <String, dynamic>{
      'color': instance.color,
      'position': instance.position,
    };
