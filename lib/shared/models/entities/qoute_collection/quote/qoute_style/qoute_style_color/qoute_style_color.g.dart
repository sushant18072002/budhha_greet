// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qoute_style_color.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QouteStyleColorsAdapter extends TypeAdapter<QouteStyleColors> {
  @override
  final int typeId = 14;

  @override
  QouteStyleColors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QouteStyleColors(
      text: fields[0] as String,
      shadow: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QouteStyleColors obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.shadow);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QouteStyleColorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QouteStyleColors _$QouteStyleColorsFromJson(Map<String, dynamic> json) =>
    QouteStyleColors(
      text: json['text'] as String,
      shadow: json['shadow'] as String,
    );

Map<String, dynamic> _$QouteStyleColorsToJson(QouteStyleColors instance) =>
    <String, dynamic>{
      'text': instance.text,
      'shadow': instance.shadow,
    };
