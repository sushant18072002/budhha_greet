// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_breakpoints.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutBreakpointsAdapter extends TypeAdapter<LayoutBreakpoints> {
  @override
  final int typeId = 87;

  @override
  LayoutBreakpoints read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutBreakpoints(
      small: fields[0] as int,
      medium: fields[1] as int,
      large: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutBreakpoints obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.small)
      ..writeByte(1)
      ..write(obj.medium)
      ..writeByte(2)
      ..write(obj.large);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutBreakpointsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutBreakpoints _$LayoutBreakpointsFromJson(Map<String, dynamic> json) =>
    LayoutBreakpoints(
      small: (json['small'] as num).toInt(),
      medium: (json['medium'] as num).toInt(),
      large: (json['large'] as num).toInt(),
    );

Map<String, dynamic> _$LayoutBreakpointsToJson(LayoutBreakpoints instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };
