// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsive_breakpoint.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponsiveBreakpointAdapter extends TypeAdapter<ResponsiveBreakpoint> {
  @override
  final int typeId = 107;

  @override
  ResponsiveBreakpoint read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponsiveBreakpoint(
      maxWidth: fields[0] as double,
      titleScale: fields[1] as double,
      quoteScale: fields[2] as double,
      spacingScale: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ResponsiveBreakpoint obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.maxWidth)
      ..writeByte(1)
      ..write(obj.titleScale)
      ..writeByte(2)
      ..write(obj.quoteScale)
      ..writeByte(3)
      ..write(obj.spacingScale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponsiveBreakpointAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsiveBreakpoint _$ResponsiveBreakpointFromJson(
        Map<String, dynamic> json) =>
    ResponsiveBreakpoint(
      maxWidth: (json['max_width'] as num).toDouble(),
      titleScale: (json['title_scale'] as num).toDouble(),
      quoteScale: (json['quote_scale'] as num).toDouble(),
      spacingScale: (json['spacing_scale'] as num).toDouble(),
    );

Map<String, dynamic> _$ResponsiveBreakpointToJson(
        ResponsiveBreakpoint instance) =>
    <String, dynamic>{
      'max_width': instance.maxWidth,
      'title_scale': instance.titleScale,
      'quote_scale': instance.quoteScale,
      'spacing_scale': instance.spacingScale,
    };
