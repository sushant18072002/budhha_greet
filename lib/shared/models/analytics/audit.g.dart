// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuditAdapter extends TypeAdapter<Audit> {
  @override
  final int typeId = 17;

  @override
  Audit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Audit(
      createdAt: fields[0] as DateTime,
      createdBy: fields[1] as String,
      modifiedAt: fields[2] as DateTime,
      modifiedBy: fields[3] as String,
      version: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Audit obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.createdBy)
      ..writeByte(2)
      ..write(obj.modifiedAt)
      ..writeByte(3)
      ..write(obj.modifiedBy)
      ..writeByte(4)
      ..write(obj.version);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuditAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Audit _$AuditFromJson(Map<String, dynamic> json) => Audit(
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
      modifiedAt: DateTime.parse(json['modifiedAt'] as String),
      modifiedBy: json['modifiedBy'] as String,
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$AuditToJson(Audit instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'modifiedAt': instance.modifiedAt.toIso8601String(),
      'modifiedBy': instance.modifiedBy,
      'version': instance.version,
    };
