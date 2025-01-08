// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_validation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TextValidationAdapter extends TypeAdapter<TextValidation> {
  @override
  final int typeId = 43;

  @override
  TextValidation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TextValidation(
      maxLength: fields[0] as int,
      minLength: fields[1] as int,
      allowedCharacters: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TextValidation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.maxLength)
      ..writeByte(1)
      ..write(obj.minLength)
      ..writeByte(2)
      ..write(obj.allowedCharacters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextValidationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextValidation _$TextValidationFromJson(Map<String, dynamic> json) =>
    TextValidation(
      maxLength: (json['maxLength'] as num).toInt(),
      minLength: (json['minLength'] as num).toInt(),
      allowedCharacters: json['allowedCharacters'] as String,
    );

Map<String, dynamic> _$TextValidationToJson(TextValidation instance) =>
    <String, dynamic>{
      'maxLength': instance.maxLength,
      'minLength': instance.minLength,
      'allowedCharacters': instance.allowedCharacters,
    };
