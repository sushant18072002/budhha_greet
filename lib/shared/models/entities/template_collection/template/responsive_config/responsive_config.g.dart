// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsive_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponsiveConfigAdapter extends TypeAdapter<ResponsiveConfig> {
  @override
  final int typeId = 104;

  @override
  ResponsiveConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponsiveConfig(
      gridConfig: fields[0] as GridConfig,
    );
  }

  @override
  void write(BinaryWriter writer, ResponsiveConfig obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.gridConfig);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponsiveConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsiveConfig _$ResponsiveConfigFromJson(Map<String, dynamic> json) =>
    ResponsiveConfig(
      gridConfig: GridConfig.fromJson(json['grid'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponsiveConfigToJson(ResponsiveConfig instance) =>
    <String, dynamic>{
      'grid': instance.gridConfig,
    };
