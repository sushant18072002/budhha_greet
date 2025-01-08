// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typography_validation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypographyValidationAdapter extends TypeAdapter<TypographyValidation> {
  @override
  final int typeId = 46;

  @override
  TypographyValidation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypographyValidation(
      minFontSize: fields[0] as int,
      maxFontSize: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TypographyValidation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.minFontSize)
      ..writeByte(1)
      ..write(obj.maxFontSize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypographyValidationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypographyValidation _$TypographyValidationFromJson(
        Map<String, dynamic> json) =>
    TypographyValidation(
      minFontSize: (json['minFontSize'] as num).toInt(),
      maxFontSize: (json['maxFontSize'] as num).toInt(),
    );

Map<String, dynamic> _$TypographyValidationToJson(
        TypographyValidation instance) =>
    <String, dynamic>{
      'minFontSize': instance.minFontSize,
      'maxFontSize': instance.maxFontSize,
    };
