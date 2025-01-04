// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_text_style.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundTextStyleAdapter extends TypeAdapter<BackgroundTextStyle> {
  @override
  final int typeId = 1;

  @override
  BackgroundTextStyle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundTextStyle(
      fontSize: fields[0] as double,
      fontFamily: fields[1] as String,
      colorHex: fields[2] as String,
      effects: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundTextStyle obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.fontSize)
      ..writeByte(1)
      ..write(obj.fontFamily)
      ..writeByte(2)
      ..write(obj.colorHex)
      ..writeByte(3)
      ..write(obj.effects);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundTextStyleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
