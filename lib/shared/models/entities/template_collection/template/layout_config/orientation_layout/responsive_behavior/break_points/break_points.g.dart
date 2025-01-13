// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'break_points.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreakpointsAdapter extends TypeAdapter<Breakpoints> {
  @override
  final int typeId = 108;

  @override
  Breakpoints read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Breakpoints(
      small: fields[0] as ResponsiveBreakpoint,
      medium: fields[1] as ResponsiveBreakpoint,
      large: fields[2] as ResponsiveBreakpoint,
    );
  }

  @override
  void write(BinaryWriter writer, Breakpoints obj) {
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
      other is BreakpointsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breakpoints _$BreakpointsFromJson(Map<String, dynamic> json) => Breakpoints(
      small:
          ResponsiveBreakpoint.fromJson(json['small'] as Map<String, dynamic>),
      medium:
          ResponsiveBreakpoint.fromJson(json['medium'] as Map<String, dynamic>),
      large:
          ResponsiveBreakpoint.fromJson(json['large'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BreakpointsToJson(Breakpoints instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };
