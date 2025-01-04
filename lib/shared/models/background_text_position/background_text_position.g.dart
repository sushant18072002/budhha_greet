// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_text_position.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundTextPositionAdapter
    extends TypeAdapter<BackgroundTextPosition> {
  @override
  final int typeId = 4;

  @override
  BackgroundTextPosition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundTextPosition(
      x: fields[0] as double,
      y: fields[1] as double,
      width: fields[2] as double,
      height: fields[3] as double,
      rotation: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundTextPosition obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.x)
      ..writeByte(1)
      ..write(obj.y)
      ..writeByte(2)
      ..write(obj.width)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.rotation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundTextPositionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
