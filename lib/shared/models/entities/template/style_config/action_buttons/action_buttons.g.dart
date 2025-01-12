// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_buttons.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActionButtonsAdapter extends TypeAdapter<ActionButtons> {
  @override
  final int typeId = 97;

  @override
  ActionButtons read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActionButtons(
      size: fields[0] as double,
      background: fields[1] as InvalidType,
      blur: fields[2] as InvalidType,
      shadow: fields[3] as InvalidType,
    );
  }

  @override
  void write(BinaryWriter writer, ActionButtons obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.size)
      ..writeByte(1)
      ..write(obj.background)
      ..writeByte(2)
      ..write(obj.blur)
      ..writeByte(3)
      ..write(obj.shadow);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActionButtonsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
