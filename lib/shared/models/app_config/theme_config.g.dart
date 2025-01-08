// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeConfigAdapter extends TypeAdapter<ThemeConfig> {
  @override
  final int typeId = 5;

  @override
  ThemeConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeConfig(
      darkModeSupport: fields[0] as bool,
      dynamicColors: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeConfig obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.darkModeSupport)
      ..writeByte(1)
      ..write(obj.dynamicColors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeConfig _$ThemeConfigFromJson(Map<String, dynamic> json) => ThemeConfig(
      darkModeSupport: json['darkModeSupport'] as bool,
      dynamicColors: json['dynamicColors'] as bool,
    );

Map<String, dynamic> _$ThemeConfigToJson(ThemeConfig instance) =>
    <String, dynamic>{
      'darkModeSupport': instance.darkModeSupport,
      'dynamicColors': instance.dynamicColors,
    };
