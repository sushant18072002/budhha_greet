// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_optimization.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundOptimizationAdapter
    extends TypeAdapter<BackgroundOptimization> {
  @override
  final int typeId = 27;

  @override
  BackgroundOptimization read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundOptimization(
      formats: (fields[0] as List).cast<String>(),
      quality: fields[1] as int,
      placeholder: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundOptimization obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.formats)
      ..writeByte(1)
      ..write(obj.quality)
      ..writeByte(2)
      ..write(obj.placeholder);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundOptimizationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundOptimization _$BackgroundOptimizationFromJson(
        Map<String, dynamic> json) =>
    BackgroundOptimization(
      formats:
          (json['formats'] as List<dynamic>).map((e) => e as String).toList(),
      quality: (json['quality'] as num).toInt(),
      placeholder: json['placeholder'] as String,
    );

Map<String, dynamic> _$BackgroundOptimizationToJson(
        BackgroundOptimization instance) =>
    <String, dynamic>{
      'formats': instance.formats,
      'quality': instance.quality,
      'placeholder': instance.placeholder,
    };
