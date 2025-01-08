// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_validation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthorValidationAdapter extends TypeAdapter<AuthorValidation> {
  @override
  final int typeId = 44;

  @override
  AuthorValidation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthorValidation(
      maxLength: fields[0] as int,
      minLength: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AuthorValidation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.maxLength)
      ..writeByte(1)
      ..write(obj.minLength);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorValidationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorValidation _$AuthorValidationFromJson(Map<String, dynamic> json) =>
    AuthorValidation(
      maxLength: (json['maxLength'] as num).toInt(),
      minLength: (json['minLength'] as num).toInt(),
    );

Map<String, dynamic> _$AuthorValidationToJson(AuthorValidation instance) =>
    <String, dynamic>{
      'maxLength': instance.maxLength,
      'minLength': instance.minLength,
    };
