// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_image_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundImageDataAdapter extends TypeAdapter<BackgroundImageData> {
  @override
  final int typeId = 19;

  @override
  BackgroundImageData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundImageData(
      original: fields[0] as String,
      thumbnail: fields[1] as String,
      placeholder: fields[2] as String,
      variants: (fields[3] as List).cast<BackgroundImageVariant>(),
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundImageData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.original)
      ..writeByte(1)
      ..write(obj.thumbnail)
      ..writeByte(2)
      ..write(obj.placeholder)
      ..writeByte(3)
      ..write(obj.variants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundImageDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundImageData _$BackgroundImageDataFromJson(Map<String, dynamic> json) =>
    BackgroundImageData(
      original: json['original'] as String,
      thumbnail: json['thumbnail'] as String,
      placeholder: json['placeholder'] as String,
      variants: (json['variants'] as List<dynamic>)
          .map(
              (e) => BackgroundImageVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BackgroundImageDataToJson(
        BackgroundImageData instance) =>
    <String, dynamic>{
      'original': instance.original,
      'thumbnail': instance.thumbnail,
      'placeholder': instance.placeholder,
      'variants': instance.variants,
    };
