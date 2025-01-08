// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguageConfigAdapter extends TypeAdapter<LanguageConfig> {
  @override
  final int typeId = 3;

  @override
  LanguageConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LanguageConfig(
      supported: (fields[0] as List).cast<String>(),
      defaultLang: fields[1] as String,
      fallback: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LanguageConfig obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.supported)
      ..writeByte(1)
      ..write(obj.defaultLang)
      ..writeByte(2)
      ..write(obj.fallback);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageConfig _$LanguageConfigFromJson(Map<String, dynamic> json) =>
    LanguageConfig(
      supported:
          (json['supported'] as List<dynamic>).map((e) => e as String).toList(),
      defaultLang: json['defaultLang'] as String,
      fallback: json['fallback'] as String,
    );

Map<String, dynamic> _$LanguageConfigToJson(LanguageConfig instance) =>
    <String, dynamic>{
      'supported': instance.supported,
      'defaultLang': instance.defaultLang,
      'fallback': instance.fallback,
    };
