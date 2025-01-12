// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_style.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommonStyleAdapter extends TypeAdapter<CommonStyle> {
  @override
  final int typeId = 88;

  @override
  CommonStyle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommonStyle(
      gradientOverlay: fields[0] as InvalidType,
      animations: fields[1] as InvalidType,
    );
  }

  @override
  void write(BinaryWriter writer, CommonStyle obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.gradientOverlay)
      ..writeByte(1)
      ..write(obj.animations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommonStyleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
