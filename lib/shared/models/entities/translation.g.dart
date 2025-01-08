// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranslationAdapter extends TypeAdapter<Translation> {
  @override
  final int typeId = 10;

  @override
  Translation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Translation(
      text: fields[0] as String,
      semanticLabel: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Translation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.semanticLabel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StyleAdapter extends TypeAdapter<Style> {
  @override
  final int typeId = 11;

  @override
  Style read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Style(
      typography: fields[0] as Typography,
      colors: fields[1] as StyleColors,
    );
  }

  @override
  void write(BinaryWriter writer, Style obj) {
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
      other is StyleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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

Translation _$TranslationFromJson(Map<String, dynamic> json) => Translation(
      text: json['text'] as String,
      semanticLabel: json['semanticLabel'] as String,
    );

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{
      'text': instance.text,
      'semanticLabel': instance.semanticLabel,
    };

Style _$StyleFromJson(Map<String, dynamic> json) => Style(
      typography:
          Typography.fromJson(json['typography'] as Map<String, dynamic>),
      colors: StyleColors.fromJson(json['colors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StyleToJson(Style instance) => <String, dynamic>{
      'typography': instance.typography,
      'colors': instance.colors,
    };

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
