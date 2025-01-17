// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_collection.dart';

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
