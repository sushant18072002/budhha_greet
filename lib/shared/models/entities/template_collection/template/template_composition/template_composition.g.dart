// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_composition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemplateCompositionAdapter extends TypeAdapter<TemplateComposition> {
  @override
  final int typeId = 31;

  @override
  TemplateComposition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateComposition(
      backgroundId: fields[0] as String,
      quoteId: fields[1] as String,
      layout: fields[2] as String,
      aspectRatio: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TemplateComposition obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.backgroundId)
      ..writeByte(1)
      ..write(obj.quoteId)
      ..writeByte(2)
      ..write(obj.layout)
      ..writeByte(3)
      ..write(obj.aspectRatio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateCompositionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateComposition _$TemplateCompositionFromJson(Map<String, dynamic> json) =>
    TemplateComposition(
      backgroundId: json['background_id'] as String,
      quoteId: json['quote_id'] as String,
      layout: json['layout'] as String,
      aspectRatio: json['aspect_ratio'] as String,
    );

Map<String, dynamic> _$TemplateCompositionToJson(
        TemplateComposition instance) =>
    <String, dynamic>{
      'background_id': instance.backgroundId,
      'quote_id': instance.quoteId,
      'layout': instance.layout,
      'aspect_ratio': instance.aspectRatio,
    };
