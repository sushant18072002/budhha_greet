// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthorCollectionAdapter extends TypeAdapter<AuthorCollection> {
  @override
  final int typeId = 70;

  @override
  AuthorCollection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthorCollection(
      data: (fields[0] as List).cast<Author>(),
    );
  }

  @override
  void write(BinaryWriter writer, AuthorCollection obj) {
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
      other is AuthorCollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AuthorAdapter extends TypeAdapter<Author> {
  @override
  final int typeId = 71;

  @override
  Author read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Author(
      uuid: fields[0] as String,
      translations: (fields[1] as Map).cast<String, AuthorTranslation>(),
      audit: fields[2] as Audit,
    );
  }

  @override
  void write(BinaryWriter writer, Author obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.translations)
      ..writeByte(2)
      ..write(obj.audit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AuthorTranslationAdapter extends TypeAdapter<AuthorTranslation> {
  @override
  final int typeId = 72;

  @override
  AuthorTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthorTranslation(
      name: fields[0] as String,
      info: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AuthorTranslation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.info);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorCollection _$AuthorCollectionFromJson(Map<String, dynamic> json) =>
    AuthorCollection(
      data: (json['data'] as List<dynamic>)
          .map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AuthorCollectionToJson(AuthorCollection instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      uuid: json['uuid'] as String,
      translations: (json['translations'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, AuthorTranslation.fromJson(e as Map<String, dynamic>)),
      ),
      audit: Audit.fromJson(json['audit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'translations': instance.translations,
      'audit': instance.audit,
    };

AuthorTranslation _$AuthorTranslationFromJson(Map<String, dynamic> json) =>
    AuthorTranslation(
      name: json['name'] as String,
      info: json['info'] as String,
    );

Map<String, dynamic> _$AuthorTranslationToJson(AuthorTranslation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'info': instance.info,
    };
