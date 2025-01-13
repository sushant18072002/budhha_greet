// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blur_sigma.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlurSigmaAdapter extends TypeAdapter<BlurSigma> {
  @override
  final int typeId = 81;

  @override
  BlurSigma read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlurSigma(
      x: fields[0] as SigmaValue,
      y: fields[1] as SigmaValue,
    );
  }

  @override
  void write(BinaryWriter writer, BlurSigma obj) {
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
      other is BlurSigmaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlurSigma _$BlurSigmaFromJson(Map<String, dynamic> json) => BlurSigma(
      x: SigmaValue.fromJson(json['x'] as Map<String, dynamic>),
      y: SigmaValue.fromJson(json['y'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlurSigmaToJson(BlurSigma instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
