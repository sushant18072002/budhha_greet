// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_adjustments.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutAdjustmentsAdapter extends TypeAdapter<LayoutAdjustments> {
  @override
  final int typeId = 98;

  @override
  LayoutAdjustments read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutAdjustments(
      spacing: fields[0] as LayoutSpacing,
      alignment: fields[1] as LayoutAlignment,
      constraints: fields[2] as LayoutConstraints,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutAdjustments obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.spacing)
      ..writeByte(1)
      ..write(obj.alignment)
      ..writeByte(2)
      ..write(obj.constraints);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutAdjustmentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutAdjustments _$LayoutAdjustmentsFromJson(Map<String, dynamic> json) =>
    LayoutAdjustments(
      spacing: LayoutSpacing.fromJson(json['spacing'] as Map<String, dynamic>),
      alignment:
          LayoutAlignment.fromJson(json['alignment'] as Map<String, dynamic>),
      constraints: LayoutConstraints.fromJson(
          json['constraints'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LayoutAdjustmentsToJson(LayoutAdjustments instance) =>
    <String, dynamic>{
      'spacing': instance.spacing,
      'alignment': instance.alignment,
      'constraints': instance.constraints,
    };
