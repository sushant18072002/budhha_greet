// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GridConfigAdapter extends TypeAdapter<GridConfig> {
  @override
  final int typeId = 104;

  @override
  GridConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GridConfig(
      spacing: fields[0] as GridSpacing,
      columns: fields[1] as GridColumns,
    );
  }

  @override
  void write(BinaryWriter writer, GridConfig obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.spacing)
      ..writeByte(1)
      ..write(obj.columns);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GridConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridConfig _$GridConfigFromJson(Map<String, dynamic> json) => GridConfig(
      spacing: GridSpacing.fromJson(json['spacing'] as Map<String, dynamic>),
      columns: GridColumns.fromJson(json['columns'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GridConfigToJson(GridConfig instance) =>
    <String, dynamic>{
      'spacing': instance.spacing,
      'columns': instance.columns,
    };
