// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_collection.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemplateCollectionAdapter extends TypeAdapter<TemplateCollection> {
  @override
  final int typeId = 79;

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
