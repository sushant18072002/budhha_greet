// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_columns.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GridColumnsAdapter extends TypeAdapter<GridColumns> {
  @override
  final int typeId = 106;

  @override
  GridColumns read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GridColumns(
      small: fields[0] as int,
      medium: fields[1] as int,
      large: fields[2] as int,
      xlarge: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GridColumns obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.small)
      ..writeByte(1)
      ..write(obj.medium)
      ..writeByte(2)
      ..write(obj.large)
      ..writeByte(3)
      ..write(obj.xlarge);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GridColumnsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridColumns _$GridColumnsFromJson(Map<String, dynamic> json) => GridColumns(
      small: (json['small'] as num).toInt(),
      medium: (json['medium'] as num).toInt(),
      large: (json['large'] as num).toInt(),
      xlarge: (json['xlarge'] as num).toInt(),
    );

Map<String, dynamic> _$GridColumnsToJson(GridColumns instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
      'xlarge': instance.xlarge,
    };
