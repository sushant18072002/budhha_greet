// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_attribution.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundAttributionAdapter extends TypeAdapter<BackgroundAttribution> {
  @override
  final int typeId = 26;

  @override
  BackgroundAttribution read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundAttribution(
      photographer: fields[0] as String?,
      license: fields[1] as String,
      url: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundAttribution obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.photographer)
      ..writeByte(1)
      ..write(obj.license)
      ..writeByte(2)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundAttributionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundAttribution _$BackgroundAttributionFromJson(
        Map<String, dynamic> json) =>
    BackgroundAttribution(
      photographer: json['photographer'] as String?,
      license: json['license'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$BackgroundAttributionToJson(
        BackgroundAttribution instance) =>
    <String, dynamic>{
      'photographer': instance.photographer,
      'license': instance.license,
      'url': instance.url,
    };
