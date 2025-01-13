// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blur.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlurAdapter extends TypeAdapter<Blur> {
  @override
  final int typeId = 80;

  @override
  Blur read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Blur(
      enabled: fields[0] as bool,
      sigma: fields[1] as BlurSigma,
      quality: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Blur obj) {
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
      other is BlurAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blur _$BlurFromJson(Map<String, dynamic> json) => Blur(
      enabled: json['enabled'] as bool,
      sigma: BlurSigma.fromJson(json['sigma'] as Map<String, dynamic>),
      quality: json['quality'] as String,
    );

Map<String, dynamic> _$BlurToJson(Blur instance) => <String, dynamic>{
      'enabled': instance.enabled,
      'sigma': instance.sigma,
      'quality': instance.quality,
    };
