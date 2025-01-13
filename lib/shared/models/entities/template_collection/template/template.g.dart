// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemplateAdapter extends TypeAdapter<Template> {
  @override
  final int typeId = 29;

  @override
  Template read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Template(
      uuid: fields[0] as String,
      translations: (fields[1] as Map).cast<String, TemplateTranslation>(),
      composition: fields[2] as Composition,
      layoutConfig: fields[3] as LayoutConfig,
      styleConfig: fields[4] as StyleConfig,
      responsiveConfig: fields[5] as ResponsiveConfig,
      categoryIds: (fields[6] as List).cast<String>(),
      tagIds: (fields[7] as List).cast<String>(),
      metadata: fields[8] as TemplateMetadata,
      metrics: fields[9] as Metrics,
      audit: fields[10] as Audit,
    );
  }

  @override
  void write(BinaryWriter writer, Template obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.translations)
      ..writeByte(2)
      ..write(obj.composition)
      ..writeByte(3)
      ..write(obj.layoutConfig)
      ..writeByte(4)
      ..write(obj.styleConfig)
      ..writeByte(5)
      ..write(obj.responsiveConfig)
      ..writeByte(6)
      ..write(obj.categoryIds)
      ..writeByte(7)
      ..write(obj.tagIds)
      ..writeByte(8)
      ..write(obj.metadata)
      ..writeByte(9)
      ..write(obj.metrics)
      ..writeByte(10)
      ..write(obj.audit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Template _$TemplateFromJson(Map<String, dynamic> json) => Template(
      uuid: json['uuid'] as String,
      translations: (json['translations'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, TemplateTranslation.fromJson(e as Map<String, dynamic>)),
      ),
      composition:
          Composition.fromJson(json['composition'] as Map<String, dynamic>),
      layoutConfig:
          LayoutConfig.fromJson(json['layout_config'] as Map<String, dynamic>),
      styleConfig:
          StyleConfig.fromJson(json['style_config'] as Map<String, dynamic>),
      responsiveConfig: ResponsiveConfig.fromJson(
          json['responsive_config'] as Map<String, dynamic>),
      categoryIds: (json['category_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tagIds:
          (json['tag_ids'] as List<dynamic>).map((e) => e as String).toList(),
      metadata:
          TemplateMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      metrics: Metrics.fromJson(json['metrics'] as Map<String, dynamic>),
      audit: Audit.fromJson(json['audit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateToJson(Template instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'translations': instance.translations,
      'composition': instance.composition,
      'layout_config': instance.layoutConfig,
      'style_config': instance.styleConfig,
      'responsive_config': instance.responsiveConfig,
      'category_ids': instance.categoryIds,
      'tag_ids': instance.tagIds,
      'metadata': instance.metadata,
      'metrics': instance.metrics,
      'audit': instance.audit,
    };
