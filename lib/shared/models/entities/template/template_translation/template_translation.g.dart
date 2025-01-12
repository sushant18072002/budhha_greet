// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_translation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemplateTranslationAdapter extends TypeAdapter<TemplateTranslation> {
  @override
  final int typeId = 30;

  @override
  TemplateTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateTranslation(
      title: fields[0] as String,
      description: fields[1] as String,
      greeting: fields[2] as String,
      semanticLabel: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TemplateTranslation obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.greeting)
      ..writeByte(3)
      ..write(obj.semanticLabel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateTranslation _$TemplateTranslationFromJson(Map<String, dynamic> json) =>
    TemplateTranslation(
      title: json['title'] as String,
      description: json['description'] as String,
      greeting: json['greeting'] as String,
      semanticLabel: json['semantic_label'] as String,
    );

Map<String, dynamic> _$TemplateTranslationToJson(
        TemplateTranslation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'greeting': instance.greeting,
      'semantic_label': instance.semanticLabel,
    };
