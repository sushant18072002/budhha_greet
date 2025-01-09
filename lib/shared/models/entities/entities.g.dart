// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntitiesAdapter extends TypeAdapter<Entities> {
  @override
  final int typeId = 6;

  @override
  Entities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Entities(
      languages: fields[0] as LanguageCollection,
      categories: fields[1] as CategoryCollection,
      authors: fields[2] as AuthorCollection,
      sources: fields[3] as SourceCollection,
      quotes: fields[4] as QuoteCollection,
      backgrounds: fields[5] as BackgroundCollection,
      templates: fields[6] as TemplateCollection,
      tagCollection: fields[7] as TagCollection,
    );
  }

  @override
  void write(BinaryWriter writer, Entities obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.languages)
      ..writeByte(1)
      ..write(obj.categories)
      ..writeByte(2)
      ..write(obj.authors)
      ..writeByte(3)
      ..write(obj.sources)
      ..writeByte(4)
      ..write(obj.quotes)
      ..writeByte(5)
      ..write(obj.backgrounds)
      ..writeByte(6)
      ..write(obj.templates)
      ..writeByte(7)
      ..write(obj.tagCollection);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entities _$EntitiesFromJson(Map<String, dynamic> json) => Entities(
      languages: LanguageCollection.fromJson(
          json['languages'] as Map<String, dynamic>),
      categories: CategoryCollection.fromJson(
          json['categories'] as Map<String, dynamic>),
      authors:
          AuthorCollection.fromJson(json['authors'] as Map<String, dynamic>),
      sources:
          SourceCollection.fromJson(json['sources'] as Map<String, dynamic>),
      quotes: QuoteCollection.fromJson(json['quotes'] as Map<String, dynamic>),
      backgrounds: BackgroundCollection.fromJson(
          json['backgrounds'] as Map<String, dynamic>),
      templates: TemplateCollection.fromJson(
          json['templates'] as Map<String, dynamic>),
      tagCollection:
          TagCollection.fromJson(json['tags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EntitiesToJson(Entities instance) => <String, dynamic>{
      'languages': instance.languages,
      'categories': instance.categories,
      'authors': instance.authors,
      'sources': instance.sources,
      'quotes': instance.quotes,
      'backgrounds': instance.backgrounds,
      'templates': instance.templates,
      'tags': instance.tagCollection,
    };
