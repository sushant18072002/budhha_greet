// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundAdapter extends TypeAdapter<Background> {
  @override
  final int typeId = 9;

  @override
  Background read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Background(
      uuid: fields[0] as String,
      type: fields[2] as String,
      translations: (fields[3] as Map).cast<String, BackGroundTranslation>(),
      visualData: fields[4] as BackgroundVisualData,
      visualEffects: fields[5] as BackgroundVisualEffects,
      categoryIds: (fields[6] as List).cast<String>(),
      tagIds: (fields[7] as List).cast<String>(),
      attribution: fields[8] as BackgroundAttribution,
      optimization: fields[9] as BackgroundOptimization,
      cacheConfig: fields[10] as CacheConfig,
      audit: fields[11] as Audit,
    );
  }

  @override
  void write(BinaryWriter writer, Background obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.translations)
      ..writeByte(4)
      ..write(obj.visualData)
      ..writeByte(5)
      ..write(obj.visualEffects)
      ..writeByte(6)
      ..write(obj.categoryIds)
      ..writeByte(7)
      ..write(obj.tagIds)
      ..writeByte(8)
      ..write(obj.attribution)
      ..writeByte(9)
      ..write(obj.optimization)
      ..writeByte(10)
      ..write(obj.cacheConfig)
      ..writeByte(11)
      ..write(obj.audit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Background _$BackgroundFromJson(Map<String, dynamic> json) => Background(
      uuid: json['uuid'] as String,
      type: json['type'] as String,
      translations: (json['translations'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, BackGroundTranslation.fromJson(e as Map<String, dynamic>)),
      ),
      visualData: BackgroundVisualData.fromJson(
          json['visual_data'] as Map<String, dynamic>),
      visualEffects: BackgroundVisualEffects.fromJson(
          json['visual_effects'] as Map<String, dynamic>),
      categoryIds: (json['category_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tagIds:
          (json['tag_ids'] as List<dynamic>).map((e) => e as String).toList(),
      attribution: BackgroundAttribution.fromJson(
          json['attribution'] as Map<String, dynamic>),
      optimization: BackgroundOptimization.fromJson(
          json['optimization'] as Map<String, dynamic>),
      cacheConfig:
          CacheConfig.fromJson(json['cache_config'] as Map<String, dynamic>),
      audit: Audit.fromJson(json['audit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BackgroundToJson(Background instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'type': instance.type,
      'translations': instance.translations,
      'visual_data': instance.visualData,
      'visual_effects': instance.visualEffects,
      'category_ids': instance.categoryIds,
      'tag_ids': instance.tagIds,
      'attribution': instance.attribution,
      'optimization': instance.optimization,
      'cache_config': instance.cacheConfig,
      'audit': instance.audit,
    };
