// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_validation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuoteValidationAdapter extends TypeAdapter<QuoteValidation> {
  @override
  final int typeId = 42;

  @override
  QuoteValidation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuoteValidation(
      text: fields[0] as TextValidation,
      author: fields[1] as AuthorValidation,
    );
  }

  @override
  void write(BinaryWriter writer, QuoteValidation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuoteValidationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteValidation _$QuoteValidationFromJson(Map<String, dynamic> json) =>
    QuoteValidation(
      text: TextValidation.fromJson(json['text'] as Map<String, dynamic>),
      author: AuthorValidation.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuoteValidationToJson(QuoteValidation instance) =>
    <String, dynamic>{
      'text': instance.text,
      'author': instance.author,
    };
