// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutConfigAdapter extends TypeAdapter<LayoutConfig> {
  @override
  final int typeId = 32;

  @override
  LayoutConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutConfig(
      responsive: fields[0] as bool,
      portrait: fields[1] as OrientationLayout,
      landscape: fields[2] as OrientationLayout,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutConfig obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.responsive)
      ..writeByte(1)
      ..write(obj.portrait)
      ..writeByte(2)
      ..write(obj.landscape);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutConfig _$LayoutConfigFromJson(Map<String, dynamic> json) => LayoutConfig(
      responsive: json['responsive'] as bool,
      portrait:
          OrientationLayout.fromJson(json['portrait'] as Map<String, dynamic>),
      landscape:
          OrientationLayout.fromJson(json['landscape'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LayoutConfigToJson(LayoutConfig instance) =>
    <String, dynamic>{
      'responsive': instance.responsive,
      'portrait': instance.portrait,
      'landscape': instance.landscape,
    };
