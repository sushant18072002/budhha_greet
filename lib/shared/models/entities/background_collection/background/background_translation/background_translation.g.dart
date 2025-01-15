// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_translation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackGroundTranslationAdapter extends TypeAdapter<BackGroundTranslation> {
  @override
  final int typeId = 80;

  @override
  BackGroundTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackGroundTranslation(
      title: fields[0] as String,
      description: fields[1] as String?,
      semanticLabel: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BackGroundTranslation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.semanticLabel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackGroundTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackGroundTranslation _$BackGroundTranslationFromJson(
        Map<String, dynamic> json) =>
    BackGroundTranslation(
      title: json['title'] as String,
      description: json['description'] as String?,
      semanticLabel: json['semantic_label'] as String?,
    );

Map<String, dynamic> _$BackGroundTranslationToJson(
        BackGroundTranslation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'semantic_label': instance.semanticLabel,
    };
