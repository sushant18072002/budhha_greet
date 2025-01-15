// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_collection.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundCollectionAdapter extends TypeAdapter<BackgroundCollection> {
  @override
  final int typeId = 63;

  @override
  BackgroundCollection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundCollection(
      schema: fields[0] as BackgroundSchema,
      data: (fields[1] as List).cast<Background>(),
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundCollection obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.schema)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundCollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundCollection _$BackgroundCollectionFromJson(
        Map<String, dynamic> json) =>
    BackgroundCollection(
      schema: BackgroundSchema.fromJson(json['schema'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Background.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BackgroundCollectionToJson(
        BackgroundCollection instance) =>
    <String, dynamic>{
      'schema': instance.schema,
      'data': instance.data,
    };
