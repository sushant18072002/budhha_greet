// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blur_sigma.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlurSigmaAdapter extends TypeAdapter<BlurSigma> {
  @override
  final int typeId = 81;

  @override
  BlurSigma read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlurSigma(
      x: fields[0] as InvalidType,
      y: fields[1] as InvalidType,
    );
  }

  @override
  void write(BinaryWriter writer, BlurSigma obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.x)
      ..writeByte(1)
      ..write(obj.y);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlurSigmaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
