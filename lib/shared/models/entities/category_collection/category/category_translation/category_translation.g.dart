// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_translation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
