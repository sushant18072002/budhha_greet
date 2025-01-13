// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_spacing.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GridSpacingAdapter extends TypeAdapter<GridSpacing> {
  @override
  final int typeId = 105;

  @override
  GridSpacing read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GridSpacing(
      small: fields[0] as double,
      medium: fields[1] as double,
      large: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GridSpacing obj) {
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
      other is GridSpacingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridSpacing _$GridSpacingFromJson(Map<String, dynamic> json) => GridSpacing(
      small: (json['small'] as num).toDouble(),
      medium: (json['medium'] as num).toDouble(),
      large: (json['large'] as num).toDouble(),
    );

Map<String, dynamic> _$GridSpacingToJson(GridSpacing instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };
