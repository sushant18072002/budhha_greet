// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetadataAdapter extends TypeAdapter<Metadata> {
  @override
  final int typeId = 1;

  @override
  Metadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Metadata(
      schemaVersion: fields[0] as String,
      lastUpdated: fields[1] as DateTime,
      minAppVersion: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Metadata obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.schemaVersion)
      ..writeByte(1)
      ..write(obj.lastUpdated)
      ..writeByte(2)
      ..write(obj.minAppVersion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      schemaVersion: json['schemaVersion'] as String,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      minAppVersion: json['minAppVersion'] as String,
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'schemaVersion': instance.schemaVersion,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'minAppVersion': instance.minAppVersion,
    };
