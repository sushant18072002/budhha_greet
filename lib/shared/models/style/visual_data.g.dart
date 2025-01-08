// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisualDataAdapter extends TypeAdapter<VisualData> {
  @override
  final int typeId = 18;

  @override
  VisualData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisualData(
      image: fields[0] as ImageData?,
      gradient: fields[1] as GradientData?,
      color: fields[2] as ColorData?,
    );
  }

  @override
  void write(BinaryWriter writer, VisualData obj) {
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
      other is VisualDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisualData _$VisualDataFromJson(Map<String, dynamic> json) => VisualData(
      image: json['image'] == null
          ? null
          : ImageData.fromJson(json['image'] as Map<String, dynamic>),
      gradient: json['gradient'] == null
          ? null
          : GradientData.fromJson(json['gradient'] as Map<String, dynamic>),
      color: json['color'] == null
          ? null
          : ColorData.fromJson(json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VisualDataToJson(VisualData instance) =>
    <String, dynamic>{
      'image': instance.image,
      'gradient': instance.gradient,
      'color': instance.color,
    };
