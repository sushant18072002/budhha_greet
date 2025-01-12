// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_metadata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

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

TemplateMetadata _$TemplateMetadataFromJson(Map<String, dynamic> json) =>
    TemplateMetadata(
      isPremium: json['is_premium'] as bool,
      status: json['status'] as String,
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$TemplateMetadataToJson(TemplateMetadata instance) =>
    <String, dynamic>{
      'is_premium': instance.isPremium,
      'status': instance.status,
      'version': instance.version,
    };
