// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_blur.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutBlurAdapter extends TypeAdapter<LayoutBlur> {
  @override
  final int typeId = 80;

  @override
  LayoutBlur read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutBlur(
      enabled: fields[0] as bool,
      sigma: fields[1] as LayoutBlurSigma,
      quality: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutBlur obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.enabled)
      ..writeByte(1)
      ..write(obj.sigma)
      ..writeByte(2)
      ..write(obj.quality);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutBlurAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutBlur _$LayoutBlurFromJson(Map<String, dynamic> json) => LayoutBlur(
      enabled: json['enabled'] as bool,
      sigma: LayoutBlurSigma.fromJson(json['sigma'] as Map<String, dynamic>),
      quality: json['quality'] as String,
    );

Map<String, dynamic> _$LayoutBlurToJson(LayoutBlur instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'sigma': instance.sigma,
      'quality': instance.quality,
    };
