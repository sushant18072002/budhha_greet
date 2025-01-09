// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TagCollectionAdapter extends TypeAdapter<TagCollection> {
  @override
  final int typeId = 65;

  @override
  TagCollection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TagCollection(
      schema: fields[0] as TagSchema,
      data: (fields[1] as List).cast<Tag>(),
    );
  }

  @override
  void write(BinaryWriter writer, TagCollection obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.schema)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagCollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TagSchemaAdapter extends TypeAdapter<TagSchema> {
  @override
  final int typeId = 66;

  @override
  TagSchema read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TagSchema(
      type: fields[0] as String,
      idPrefix: fields[1] as String,
      indexes: (fields[2] as List).cast<String>(),
      required: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, TagSchema obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.idPrefix)
      ..writeByte(2)
      ..write(obj.indexes)
      ..writeByte(3)
      ..write(obj.required);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagSchemaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TagAdapter extends TypeAdapter<Tag> {
  @override
  final int typeId = 67;

  @override
  Tag read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tag(
      id: fields[0] as String,
      category: fields[1] as String,
      translations: (fields[2] as Map).cast<String, TagTranslation>(),
      metadata: fields[3] as TagMetadata,
      audit: fields[4] as Audit,
    );
  }

  @override
  void write(BinaryWriter writer, Tag obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.translations)
      ..writeByte(3)
      ..write(obj.metadata)
      ..writeByte(4)
      ..write(obj.audit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TagTranslationAdapter extends TypeAdapter<TagTranslation> {
  @override
  final int typeId = 68;

  @override
  TagTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TagTranslation(
      name: fields[0] as String,
      description: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TagTranslation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TagMetadataAdapter extends TypeAdapter<TagMetadata> {
  @override
  final int typeId = 69;

  @override
  TagMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TagMetadata(
      icon: fields[0] as String,
      color: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TagMetadata obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.icon)
      ..writeByte(1)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagCollection _$TagCollectionFromJson(Map<String, dynamic> json) =>
    TagCollection(
      schema: TagSchema.fromJson(json['schema'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TagCollectionToJson(TagCollection instance) =>
    <String, dynamic>{
      'schema': instance.schema,
      'data': instance.data,
    };

TagSchema _$TagSchemaFromJson(Map<String, dynamic> json) => TagSchema(
      type: json['type'] as String,
      idPrefix: json['id_prefix'] as String,
      indexes:
          (json['indexes'] as List<dynamic>).map((e) => e as String).toList(),
      required:
          (json['required'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TagSchemaToJson(TagSchema instance) => <String, dynamic>{
      'type': instance.type,
      'id_prefix': instance.idPrefix,
      'indexes': instance.indexes,
      'required': instance.required,
    };

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      id: json['id'] as String,
      category: json['category'] as String,
      translations: (json['translations'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, TagTranslation.fromJson(e as Map<String, dynamic>)),
      ),
      metadata: TagMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      audit: Audit.fromJson(json['audit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'translations': instance.translations,
      'metadata': instance.metadata,
      'audit': instance.audit,
    };

TagTranslation _$TagTranslationFromJson(Map<String, dynamic> json) =>
    TagTranslation(
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$TagTranslationToJson(TagTranslation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

TagMetadata _$TagMetadataFromJson(Map<String, dynamic> json) => TagMetadata(
      icon: json['icon'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$TagMetadataToJson(TagMetadata instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'color': instance.color,
    };
