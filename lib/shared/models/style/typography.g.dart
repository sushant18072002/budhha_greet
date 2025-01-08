// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typography.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypographyAdapter extends TypeAdapter<Typography> {
  @override
  final int typeId = 12;

  @override
  Typography read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Typography(
      fontFamily: fields[0] as String,
      fontSize: fields[1] as FontSize,
      fontWeight: fields[2] as String,
      letterSpacing: fields[3] as double,
      lineHeight: fields[4] as double,
      textAlign: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Typography obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.fontFamily)
      ..writeByte(1)
      ..write(obj.fontSize)
      ..writeByte(2)
      ..write(obj.fontWeight)
      ..writeByte(3)
      ..write(obj.letterSpacing)
      ..writeByte(4)
      ..write(obj.lineHeight)
      ..writeByte(5)
      ..write(obj.textAlign);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypographyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Typography _$TypographyFromJson(Map<String, dynamic> json) => Typography(
      fontFamily: json['fontFamily'] as String,
      fontSize: FontSize.fromJson(json['fontSize'] as Map<String, dynamic>),
      fontWeight: json['fontWeight'] as String,
      letterSpacing: (json['letterSpacing'] as num).toDouble(),
      lineHeight: (json['lineHeight'] as num).toDouble(),
      textAlign: json['textAlign'] as String,
    );

Map<String, dynamic> _$TypographyToJson(Typography instance) =>
    <String, dynamic>{
      'fontFamily': instance.fontFamily,
      'fontSize': instance.fontSize,
      'fontWeight': instance.fontWeight,
      'letterSpacing': instance.letterSpacing,
      'lineHeight': instance.lineHeight,
      'textAlign': instance.textAlign,
    };
