// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_visual_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundVisualDataAdapter extends TypeAdapter<BackgroundVisualData> {
  @override
  final int typeId = 18;

  @override
  BackgroundVisualData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundVisualData(
      image: fields[0] as BackgroundImageData?,
      gradient: fields[1] as BackgroundGradientData?,
      color: fields[2] as BackgroundColorData?,
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundVisualData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.gradient)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundVisualDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundVisualData _$BackgroundVisualDataFromJson(
        Map<String, dynamic> json) =>
    BackgroundVisualData(
      image: json['image'] == null
          ? null
          : BackgroundImageData.fromJson(json['image'] as Map<String, dynamic>),
      gradient: json['gradient'] == null
          ? null
          : BackgroundGradientData.fromJson(
              json['gradient'] as Map<String, dynamic>),
      color: json['color'] == null
          ? null
          : BackgroundColorData.fromJson(json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BackgroundVisualDataToJson(
        BackgroundVisualData instance) =>
    <String, dynamic>{
      'image': instance.image,
      'gradient': instance.gradient,
      'color': instance.color,
    };
