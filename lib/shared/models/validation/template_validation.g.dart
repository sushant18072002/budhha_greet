// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_validation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemplateValidationAdapter extends TypeAdapter<TemplateValidation> {
  @override
  final int typeId = 45;

  @override
  TemplateValidation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateValidation(
      greeting: fields[0] as TextValidation,
      typography: fields[1] as TypographyValidation,
    );
  }

  @override
  void write(BinaryWriter writer, TemplateValidation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.greeting)
      ..writeByte(1)
      ..write(obj.typography);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateValidationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateValidation _$TemplateValidationFromJson(Map<String, dynamic> json) =>
    TemplateValidation(
      greeting:
          TextValidation.fromJson(json['greeting'] as Map<String, dynamic>),
      typography: TypographyValidation.fromJson(
          json['typography'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateValidationToJson(TemplateValidation instance) =>
    <String, dynamic>{
      'greeting': instance.greeting,
      'typography': instance.typography,
    };
