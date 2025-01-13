// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blur.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlurAdapter extends TypeAdapter<Blur> {
  @override
  final int typeId = 203;

  @override
  Blur read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Blur(
      enabled: fields[0] as bool,
      sigma: fields[1] as Sigma,
    );
  }

  @override
  void write(BinaryWriter writer, Blur obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.enabled)
      ..writeByte(1)
      ..write(obj.sigma);
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
      sigma: Sigma.fromJson(json['sigma'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlurToJson(Blur instance) => <String, dynamic>{
      'enabled': instance.enabled,
      'sigma': instance.sigma,
    };
