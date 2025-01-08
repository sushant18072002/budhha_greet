// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_rules.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ValidationRulesAdapter extends TypeAdapter<ValidationRules> {
  @override
  final int typeId = 41;

  @override
  ValidationRules read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ValidationRules(
      quotes: fields[0] as QuoteValidation,
      templates: fields[1] as TemplateValidation,
    );
  }

  @override
  void write(BinaryWriter writer, ValidationRules obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.quotes)
      ..writeByte(1)
      ..write(obj.templates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValidationRulesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidationRules _$ValidationRulesFromJson(Map<String, dynamic> json) =>
    ValidationRules(
      quotes: QuoteValidation.fromJson(json['quotes'] as Map<String, dynamic>),
      templates: TemplateValidation.fromJson(
          json['templates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ValidationRulesToJson(ValidationRules instance) =>
    <String, dynamic>{
      'quotes': instance.quotes,
      'templates': instance.templates,
    };
