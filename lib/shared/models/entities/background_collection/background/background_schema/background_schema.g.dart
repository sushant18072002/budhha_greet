// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_schema.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundSchemaAdapter extends TypeAdapter<BackgroundSchema> {
  @override
  final int typeId = 64;

  @override
  BackgroundSchema read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundSchema(
      type: fields[0] as String,
      indexes: (fields[1] as List).cast<String>(),
      required: (fields[2] as List).cast<String>(),
      unique: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundSchema obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.indexes)
      ..writeByte(2)
      ..write(obj.required)
      ..writeByte(3)
      ..write(obj.unique);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundSchemaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundSchema _$BackgroundSchemaFromJson(Map<String, dynamic> json) =>
    BackgroundSchema(
      type: json['type'] as String,
      indexes:
          (json['indexes'] as List<dynamic>).map((e) => e as String).toList(),
      required:
          (json['required'] as List<dynamic>).map((e) => e as String).toList(),
      unique:
          (json['unique'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BackgroundSchemaToJson(BackgroundSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'indexes': instance.indexes,
      'required': instance.required,
      'unique': instance.unique,
    };
