// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_constraints.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutConstraintsAdapter extends TypeAdapter<LayoutConstraints> {
  @override
  final int typeId = 101;

  @override
  LayoutConstraints read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutConstraints(
      maxWidth: fields[0] as MaxWidth,
      minHeight: fields[1] as MinHeight,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutConstraints obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.maxWidth)
      ..writeByte(1)
      ..write(obj.minHeight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutConstraintsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutConstraints _$LayoutConstraintsFromJson(Map<String, dynamic> json) =>
    LayoutConstraints(
      maxWidth: MaxWidth.fromJson(json['max_width'] as Map<String, dynamic>),
      minHeight: MinHeight.fromJson(json['min_height'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LayoutConstraintsToJson(LayoutConstraints instance) =>
    <String, dynamic>{
      'max_width': instance.maxWidth,
      'min_height': instance.minHeight,
    };
