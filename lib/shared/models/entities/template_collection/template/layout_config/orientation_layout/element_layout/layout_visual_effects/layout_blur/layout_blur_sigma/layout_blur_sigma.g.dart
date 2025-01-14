// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_blur_sigma.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutBlurSigmaAdapter extends TypeAdapter<LayoutBlurSigma> {
  @override
  final int typeId = 81;

  @override
  LayoutBlurSigma read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutBlurSigma(
      x: fields[0] as LayoutSigmaValue,
      y: fields[1] as LayoutSigmaValue,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutBlurSigma obj) {
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
      other is LayoutBlurSigmaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutBlurSigma _$LayoutBlurSigmaFromJson(Map<String, dynamic> json) =>
    LayoutBlurSigma(
      x: LayoutSigmaValue.fromJson(json['x'] as Map<String, dynamic>),
      y: LayoutSigmaValue.fromJson(json['y'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LayoutBlurSigmaToJson(LayoutBlurSigma instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
