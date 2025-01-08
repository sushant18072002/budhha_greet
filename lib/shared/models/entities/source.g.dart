// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SourceCollectionAdapter extends TypeAdapter<SourceCollection> {
  @override
  final int typeId = 73;

  @override
  SourceCollection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SourceCollection(
      data: (fields[0] as List).cast<Source>(),
    );
  }

  @override
  void write(BinaryWriter writer, SourceCollection obj) {
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
      other is SourceCollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SourceAdapter extends TypeAdapter<Source> {
  @override
  final int typeId = 74;

  @override
  Source read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Source(
      uuid: fields[0] as String,
      translations: (fields[1] as Map).cast<String, SourceTranslation>(),
      reference: fields[2] as String,
      type: fields[3] as String,
      audit: fields[4] as Audit,
    );
  }

  @override
  void write(BinaryWriter writer, Source obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.translations)
      ..writeByte(2)
      ..write(obj.reference)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.audit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SourceTranslationAdapter extends TypeAdapter<SourceTranslation> {
  @override
  final int typeId = 75;

  @override
  SourceTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SourceTranslation(
      title: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SourceTranslation obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceCollection _$SourceCollectionFromJson(Map<String, dynamic> json) =>
    SourceCollection(
      data: (json['data'] as List<dynamic>)
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SourceCollectionToJson(SourceCollection instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      uuid: json['uuid'] as String,
      translations: (json['translations'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, SourceTranslation.fromJson(e as Map<String, dynamic>)),
      ),
      reference: json['reference'] as String,
      type: json['type'] as String,
      audit: Audit.fromJson(json['audit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'translations': instance.translations,
      'reference': instance.reference,
      'type': instance.type,
      'audit': instance.audit,
    };

SourceTranslation _$SourceTranslationFromJson(Map<String, dynamic> json) =>
    SourceTranslation(
      title: json['title'] as String,
    );

Map<String, dynamic> _$SourceTranslationToJson(SourceTranslation instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
