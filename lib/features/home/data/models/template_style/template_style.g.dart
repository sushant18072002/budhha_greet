// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_style.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemplateStyleAdapter extends TypeAdapter<TemplateStyle> {
  @override
  final int typeId = 6;

  @override
  TemplateStyle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateStyle(
      greeting: fields[0] as BackgroundTextStyle,
      quote: fields[1] as BackgroundTextStyle,
    );
  }

  @override
  void write(BinaryWriter writer, TemplateStyle obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.greeting)
      ..writeByte(1)
      ..write(obj.quote);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateStyleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
