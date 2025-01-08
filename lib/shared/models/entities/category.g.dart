// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryCollectionAdapter extends TypeAdapter<CategoryCollection> {
  @override
  final int typeId = 58;

  @override
  CategoryCollection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryCollection(
      schema: fields[0] as CategorySchema,
      data: (fields[1] as List).cast<Category>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryCollection obj) {
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
      other is CategoryCollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategorySchemaAdapter extends TypeAdapter<CategorySchema> {
  @override
  final int typeId = 59;

  @override
  CategorySchema read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategorySchema(
      type: fields[0] as String,
      idPrefix: fields[1] as String,
      indexes: (fields[2] as List).cast<String>(),
      required: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategorySchema obj) {
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
      other is CategorySchemaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 60;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      id: fields[0] as String,
      type: fields[1] as String,
      parentId: fields[2] as String?,
      translations: (fields[3] as Map).cast<String, CategoryTranslation>(),
      metadata: fields[4] as CategoryMetadata,
      audit: fields[5] as Audit,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.parentId)
      ..writeByte(3)
      ..write(obj.translations)
      ..writeByte(4)
      ..write(obj.metadata)
      ..writeByte(5)
      ..write(obj.audit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryTranslationAdapter extends TypeAdapter<CategoryTranslation> {
  @override
  final int typeId = 61;

  @override
  CategoryTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryTranslation(
      name: fields[0] as String,
      description: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryTranslation obj) {
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
      other is CategoryTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryMetadataAdapter extends TypeAdapter<CategoryMetadata> {
  @override
  final int typeId = 62;

  @override
  CategoryMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryMetadata(
      icon: fields[0] as String,
      color: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryMetadata obj) {
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
      other is CategoryMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryCollection _$CategoryCollectionFromJson(Map<String, dynamic> json) =>
    CategoryCollection(
      schema: CategorySchema.fromJson(json['schema'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryCollectionToJson(CategoryCollection instance) =>
    <String, dynamic>{
      'schema': instance.schema,
      'data': instance.data,
    };

CategorySchema _$CategorySchemaFromJson(Map<String, dynamic> json) =>
    CategorySchema(
      type: json['type'] as String,
      idPrefix: json['idPrefix'] as String,
      indexes:
          (json['indexes'] as List<dynamic>).map((e) => e as String).toList(),
      required:
          (json['required'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CategorySchemaToJson(CategorySchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'idPrefix': instance.idPrefix,
      'indexes': instance.indexes,
      'required': instance.required,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      type: json['type'] as String,
      parentId: json['parentId'] as String?,
      translations: (json['translations'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, CategoryTranslation.fromJson(e as Map<String, dynamic>)),
      ),
      metadata:
          CategoryMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      audit: Audit.fromJson(json['audit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'parentId': instance.parentId,
      'translations': instance.translations,
      'metadata': instance.metadata,
      'audit': instance.audit,
    };

CategoryTranslation _$CategoryTranslationFromJson(Map<String, dynamic> json) =>
    CategoryTranslation(
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CategoryTranslationToJson(
        CategoryTranslation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

CategoryMetadata _$CategoryMetadataFromJson(Map<String, dynamic> json) =>
    CategoryMetadata(
      icon: json['icon'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$CategoryMetadataToJson(CategoryMetadata instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'color': instance.color,
    };
