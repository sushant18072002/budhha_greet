// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_image_variant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundImageVariantAdapter
    extends TypeAdapter<BackgroundImageVariant> {
  @override
  final int typeId = 20;

  @override
  BackgroundImageVariant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundImageVariant(
      width: fields[0] as int,
      height: fields[1] as int,
      path: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundImageVariant obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.width)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundImageVariantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundImageVariant _$BackgroundImageVariantFromJson(
        Map<String, dynamic> json) =>
    BackgroundImageVariant(
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      path: json['path'] as String,
    );

Map<String, dynamic> _$BackgroundImageVariantToJson(
        BackgroundImageVariant instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'path': instance.path,
    };
