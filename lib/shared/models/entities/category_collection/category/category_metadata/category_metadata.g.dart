// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_metadata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

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
