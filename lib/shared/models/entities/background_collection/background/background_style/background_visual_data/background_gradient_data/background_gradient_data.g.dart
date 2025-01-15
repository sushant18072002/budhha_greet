// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_gradient_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundGradientDataAdapter
    extends TypeAdapter<BackgroundGradientData> {
  @override
  final int typeId = 21;

  @override
  BackgroundGradientData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundGradientData(
      colors: (fields[0] as List).cast<String>(),
      type: fields[1] as String,
      angle: fields[2] as double,
      stops: (fields[3] as List).cast<BackgroundGradientStop>(),
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundGradientData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.colors)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.angle)
      ..writeByte(3)
      ..write(obj.stops);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundGradientDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundGradientData _$BackgroundGradientDataFromJson(
        Map<String, dynamic> json) =>
    BackgroundGradientData(
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
      type: json['type'] as String,
      angle: (json['angle'] as num).toDouble(),
      stops: (json['stops'] as List<dynamic>)
          .map(
              (e) => BackgroundGradientStop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BackgroundGradientDataToJson(
        BackgroundGradientData instance) =>
    <String, dynamic>{
      'colors': instance.colors,
      'type': instance.type,
      'angle': instance.angle,
      'stops': instance.stops,
    };
