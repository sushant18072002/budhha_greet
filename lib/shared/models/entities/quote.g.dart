// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuoteCollectionAdapter extends TypeAdapter<QuoteCollection> {
  @override
  final int typeId = 77;

  @override
  QuoteCollection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuoteCollection(
      data: (fields[0] as List).cast<Quote>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuoteCollection obj) {
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
      other is QuoteCollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuoteAdapter extends TypeAdapter<Quote> {
  @override
  final int typeId = 8;

  @override
  Quote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Quote(
      uuid: fields[0] as String,
      translations: (fields[1] as Map).cast<String, Translation>(),
      authorId: fields[2] as String,
      sourceId: fields[3] as String,
      categoryIds: (fields[4] as List).cast<String>(),
      tagIds: (fields[5] as List).cast<String>(),
      style: fields[6] as Style,
      metadata: fields[7] as QuoteMetadata,
      metrics: fields[8] as Metrics,
      audit: fields[9] as Audit,
    );
  }

  @override
  void write(BinaryWriter writer, Quote obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.translations)
      ..writeByte(2)
      ..write(obj.authorId)
      ..writeByte(3)
      ..write(obj.sourceId)
      ..writeByte(4)
      ..write(obj.categoryIds)
      ..writeByte(5)
      ..write(obj.tagIds)
      ..writeByte(6)
      ..write(obj.style)
      ..writeByte(7)
      ..write(obj.metadata)
      ..writeByte(8)
      ..write(obj.metrics)
      ..writeByte(9)
      ..write(obj.audit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuoteMetadataAdapter extends TypeAdapter<QuoteMetadata> {
  @override
  final int typeId = 15;

  @override
  QuoteMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuoteMetadata(
      originalLanguage: fields[0] as String,
      moderationStatus: fields[1] as String,
      moderationDate: fields[2] as DateTime,
      moderationBy: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QuoteMetadata obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.originalLanguage)
      ..writeByte(1)
      ..write(obj.moderationStatus)
      ..writeByte(2)
      ..write(obj.moderationDate)
      ..writeByte(3)
      ..write(obj.moderationBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuoteMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteCollection _$QuoteCollectionFromJson(Map<String, dynamic> json) =>
    QuoteCollection(
      data: (json['data'] as List<dynamic>)
          .map((e) => Quote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuoteCollectionToJson(QuoteCollection instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      uuid: json['uuid'] as String,
      translations: (json['translations'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Translation.fromJson(e as Map<String, dynamic>)),
      ),
      authorId: json['author_id'] as String,
      sourceId: json['source_id'] as String,
      categoryIds: (json['category_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tagIds:
          (json['tag_ids'] as List<dynamic>).map((e) => e as String).toList(),
      style: Style.fromJson(json['style'] as Map<String, dynamic>),
      metadata:
          QuoteMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      metrics: Metrics.fromJson(json['metrics'] as Map<String, dynamic>),
      audit: Audit.fromJson(json['audit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'translations': instance.translations,
      'author_id': instance.authorId,
      'source_id': instance.sourceId,
      'category_ids': instance.categoryIds,
      'tag_ids': instance.tagIds,
      'style': instance.style,
      'metadata': instance.metadata,
      'metrics': instance.metrics,
      'audit': instance.audit,
    };

QuoteMetadata _$QuoteMetadataFromJson(Map<String, dynamic> json) =>
    QuoteMetadata(
      originalLanguage: json['original_language'] as String,
      moderationStatus: json['moderation_status'] as String,
      moderationDate: DateTime.parse(json['moderation_date'] as String),
      moderationBy: json['moderation_by'] as String,
    );

Map<String, dynamic> _$QuoteMetadataToJson(QuoteMetadata instance) =>
    <String, dynamic>{
      'original_language': instance.originalLanguage,
      'moderation_status': instance.moderationStatus,
      'moderation_date': instance.moderationDate.toIso8601String(),
      'moderation_by': instance.moderationBy,
    };
