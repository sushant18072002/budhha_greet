// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_gradient_overlay.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommonGradientOverlayAdapter extends TypeAdapter<CommonGradientOverlay> {
  @override
  final int typeId = 89;

  @override
  CommonGradientOverlay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommonGradientOverlay(
      enabled: fields[0] as bool,
      stops: (fields[1] as List).cast<CommonGradientStop>(),
      angle: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CommonGradientOverlay obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.enabled)
      ..writeByte(1)
      ..write(obj.stops)
      ..writeByte(2)
      ..write(obj.angle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommonGradientOverlayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonGradientOverlay _$CommonGradientOverlayFromJson(
        Map<String, dynamic> json) =>
    CommonGradientOverlay(
      enabled: json['enabled'] as bool,
      stops: (json['stops'] as List<dynamic>)
          .map((e) => CommonGradientStop.fromJson(e as Map<String, dynamic>))
          .toList(),
      angle: (json['angle'] as num).toInt(),
    );

Map<String, dynamic> _$CommonGradientOverlayToJson(
        CommonGradientOverlay instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'stops': instance.stops,
      'angle': instance.angle,
    };
