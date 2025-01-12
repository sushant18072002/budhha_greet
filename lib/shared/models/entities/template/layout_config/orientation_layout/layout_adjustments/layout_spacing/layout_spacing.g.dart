// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_spacing.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutSpacingAdapter extends TypeAdapter<LayoutSpacing> {
  @override
  final int typeId = 99;

  @override
  LayoutSpacing read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutSpacing(
      betweenElements: fields[0] as double,
      horizontalMargin: fields[1] as double,
      verticalMargin: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutSpacing obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.betweenElements)
      ..writeByte(1)
      ..write(obj.horizontalMargin)
      ..writeByte(2)
      ..write(obj.verticalMargin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutSpacingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutSpacing _$LayoutSpacingFromJson(Map<String, dynamic> json) =>
    LayoutSpacing(
      betweenElements: (json['between_elements'] as num).toDouble(),
      horizontalMargin: (json['horizontal_margin'] as num).toDouble(),
      verticalMargin: (json['vertical_margin'] as num).toDouble(),
    );

Map<String, dynamic> _$LayoutSpacingToJson(LayoutSpacing instance) =>
    <String, dynamic>{
      'between_elements': instance.betweenElements,
      'horizontal_margin': instance.horizontalMargin,
      'vertical_margin': instance.verticalMargin,
    };
