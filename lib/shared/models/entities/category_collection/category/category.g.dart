// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      type: json['type'] as String,
      parentId: json['parent_id'] as String?,
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
      'parent_id': instance.parentId,
      'translations': instance.translations,
      'metadata': instance.metadata,
      'audit': instance.audit,
    };
