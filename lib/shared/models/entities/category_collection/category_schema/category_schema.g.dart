// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_schema.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategorySchema _$CategorySchemaFromJson(Map<String, dynamic> json) =>
    CategorySchema(
      type: json['type'] as String,
      idPrefix: json['id_prefix'] as String,
      indexes:
          (json['indexes'] as List<dynamic>).map((e) => e as String).toList(),
      required:
          (json['required'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CategorySchemaToJson(CategorySchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id_prefix': instance.idPrefix,
      'indexes': instance.indexes,
      'required': instance.required,
    };
