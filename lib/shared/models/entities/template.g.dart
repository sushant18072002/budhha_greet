// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemplateCollectionAdapter extends TypeAdapter<TemplateCollection> {
  @override
  final int typeId = 77;

  @override
  TemplateCollection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateCollection(
      data: (fields[0] as List).cast<Template>(),
    );
  }

  @override
  void write(BinaryWriter writer, TemplateCollection obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateCollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      categoryIds: (fields[5] as List).cast<String>(),
      tagIds: (fields[6] as List).cast<String>(),
      metadata: fields[7] as TemplateMetadata,
      metrics: fields[8] as Metrics,
      audit: fields[9] as Audit,
    );
  }

  @override
  void write(BinaryWriter writer, Template obj) {
    writer
      ..writeByte(10)
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
      ..write(obj.categoryIds)
      ..writeByte(6)
      ..write(obj.tagIds)
      ..writeByte(7)
      ..write(obj.metadata)
      ..writeByte(8)
      ..write(obj.metrics)
      ..writeByte(9)
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

class CompositionAdapter extends TypeAdapter<Composition> {
  @override
  final int typeId = 31;

  @override
  Composition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Composition(
      backgroundId: fields[0] as String,
      quoteId: fields[1] as String,
      layout: fields[2] as String,
      aspectRatio: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Composition obj) {
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
      other is CompositionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StyleConfigAdapter extends TypeAdapter<StyleConfig> {
  @override
  final int typeId = 38;

  @override
  StyleConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StyleConfig(
      greeting: fields[0] as ElementStyle,
    );
  }

  @override
  void write(BinaryWriter writer, StyleConfig obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.greeting);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StyleConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ElementStyleAdapter extends TypeAdapter<ElementStyle> {
  @override
  final int typeId = 39;

  @override
  ElementStyle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ElementStyle(
      typography: fields[0] as Typography,
      colors: fields[1] as StyleColors,
    );
  }

  @override
  void write(BinaryWriter writer, ElementStyle obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.typography)
      ..writeByte(1)
      ..write(obj.colors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ElementStyleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TemplateMetadataAdapter extends TypeAdapter<TemplateMetadata> {
  @override
  final int typeId = 40;

  @override
  TemplateMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateMetadata(
      isPremium: fields[0] as bool,
      status: fields[1] as String,
      version: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TemplateMetadata obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isPremium)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.version);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateCollection _$TemplateCollectionFromJson(Map<String, dynamic> json) =>
    TemplateCollection(
      data: (json['data'] as List<dynamic>)
          .map((e) => Template.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TemplateCollectionToJson(TemplateCollection instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Template _$TemplateFromJson(Map<String, dynamic> json) => Template(
      uuid: json['uuid'] as String,
      translations: (json['translations'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, TemplateTranslation.fromJson(e as Map<String, dynamic>)),
      ),
      composition:
          Composition.fromJson(json['composition'] as Map<String, dynamic>),
      layoutConfig:
          LayoutConfig.fromJson(json['layoutConfig'] as Map<String, dynamic>),
      styleConfig:
          StyleConfig.fromJson(json['styleConfig'] as Map<String, dynamic>),
      categoryIds: (json['categoryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tagIds:
          (json['tagIds'] as List<dynamic>).map((e) => e as String).toList(),
      metadata:
          TemplateMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      metrics: Metrics.fromJson(json['metrics'] as Map<String, dynamic>),
      audit: Audit.fromJson(json['audit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateToJson(Template instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'translations': instance.translations,
      'composition': instance.composition,
      'layoutConfig': instance.layoutConfig,
      'styleConfig': instance.styleConfig,
      'categoryIds': instance.categoryIds,
      'tagIds': instance.tagIds,
      'metadata': instance.metadata,
      'metrics': instance.metrics,
      'audit': instance.audit,
    };

TemplateTranslation _$TemplateTranslationFromJson(Map<String, dynamic> json) =>
    TemplateTranslation(
      title: json['title'] as String,
      description: json['description'] as String,
      greeting: json['greeting'] as String,
      semanticLabel: json['semanticLabel'] as String,
    );

Map<String, dynamic> _$TemplateTranslationToJson(
        TemplateTranslation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'greeting': instance.greeting,
      'semanticLabel': instance.semanticLabel,
    };

Composition _$CompositionFromJson(Map<String, dynamic> json) => Composition(
      backgroundId: json['backgroundId'] as String,
      quoteId: json['quoteId'] as String,
      layout: json['layout'] as String,
      aspectRatio: json['aspectRatio'] as String,
    );

Map<String, dynamic> _$CompositionToJson(Composition instance) =>
    <String, dynamic>{
      'backgroundId': instance.backgroundId,
      'quoteId': instance.quoteId,
      'layout': instance.layout,
      'aspectRatio': instance.aspectRatio,
    };

StyleConfig _$StyleConfigFromJson(Map<String, dynamic> json) => StyleConfig(
      greeting: ElementStyle.fromJson(json['greeting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StyleConfigToJson(StyleConfig instance) =>
    <String, dynamic>{
      'greeting': instance.greeting,
    };

ElementStyle _$ElementStyleFromJson(Map<String, dynamic> json) => ElementStyle(
      typography:
          Typography.fromJson(json['typography'] as Map<String, dynamic>),
      colors: StyleColors.fromJson(json['colors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElementStyleToJson(ElementStyle instance) =>
    <String, dynamic>{
      'typography': instance.typography,
      'colors': instance.colors,
    };

TemplateMetadata _$TemplateMetadataFromJson(Map<String, dynamic> json) =>
    TemplateMetadata(
      isPremium: json['isPremium'] as bool,
      status: json['status'] as String,
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$TemplateMetadataToJson(TemplateMetadata instance) =>
    <String, dynamic>{
      'isPremium': instance.isPremium,
      'status': instance.status,
      'version': instance.version,
    };
