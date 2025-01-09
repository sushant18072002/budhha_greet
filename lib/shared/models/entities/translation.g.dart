// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranslationAdapter extends TypeAdapter<Translation> {
  @override
  final int typeId = 10;

  @override
  Translation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Translation(
      text: fields[0] as String,
      description: fields[1] as String?,
      semanticLabel: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Translation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.semanticLabel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Translation _$TranslationFromJson(Map<String, dynamic> json) => Translation(
      text: json['text'] as String,
      description: json['description'] as String?,
      semanticLabel: json['semantic_label'] as String?,
    );

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{
      'text': instance.text,
      'description': instance.description,
      'semantic_label': instance.semanticLabel,
    };
