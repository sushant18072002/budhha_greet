// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qoute_style.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QouteStyleAdapter extends TypeAdapter<QouteStyle> {
  @override
  final int typeId = 11;

  @override
  QouteStyle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QouteStyle(
      typography: fields[0] as QouteTypography,
      colors: fields[1] as QouteStyleColors,
    );
  }

  @override
  void write(BinaryWriter writer, QouteStyle obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.typography)
      ..writeByte(1)
      ..write(obj.colors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QouteStyleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QouteStyle _$QouteStyleFromJson(Map<String, dynamic> json) => QouteStyle(
      typography:
          QouteTypography.fromJson(json['typography'] as Map<String, dynamic>),
      colors: QouteStyleColors.fromJson(json['colors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QouteStyleToJson(QouteStyle instance) =>
    <String, dynamic>{
      'typography': instance.typography,
      'colors': instance.colors,
    };
