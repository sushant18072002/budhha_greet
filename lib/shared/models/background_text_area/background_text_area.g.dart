// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_text_area.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundTextAreaAdapter extends TypeAdapter<BackgroundTextArea> {
  @override
  final int typeId = 3;

  @override
  BackgroundTextArea read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundTextArea(
      id: fields[0] as String,
      portrait: fields[1] as BackgroundTextPosition,
      landscape: fields[2] as BackgroundTextPosition,
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundTextArea obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.portrait)
      ..writeByte(2)
      ..write(obj.landscape);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundTextAreaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
