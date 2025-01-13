// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typography.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypographyAdapter extends TypeAdapter<Typography> {
  @override
  final int typeId = 93;

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
      textTransform: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Typography obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.textAlign)
      ..writeByte(6)
      ..write(obj.textTransform);
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
      fontFamily: json['font_family'] as String,
      fontSize: FontSize.fromJson(json['font_size'] as Map<String, dynamic>),
      fontWeight: json['font_weight'] as String,
      letterSpacing: (json['letter_spacing'] as num).toDouble(),
      lineHeight: (json['line_height'] as num).toDouble(),
      textAlign: json['text_align'] as String,
      textTransform: json['text_transform'] as String,
    );

Map<String, dynamic> _$TypographyToJson(Typography instance) =>
    <String, dynamic>{
      'font_family': instance.fontFamily,
      'font_size': instance.fontSize,
      'font_weight': instance.fontWeight,
      'letter_spacing': instance.letterSpacing,
      'line_height': instance.lineHeight,
      'text_align': instance.textAlign,
      'text_transform': instance.textTransform,
    };
