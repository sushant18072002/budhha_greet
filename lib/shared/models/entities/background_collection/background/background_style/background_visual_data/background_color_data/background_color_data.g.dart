// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_color_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundColorDataAdapter extends TypeAdapter<BackgroundColorData> {
  @override
  final int typeId = 23;

  @override
  BackgroundColorData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundColorData(
      color: fields[0] as String,
      palette: fields[1] as BackgroundColorPalette,
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundColorData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.palette);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundColorDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundColorData _$BackgroundColorDataFromJson(Map<String, dynamic> json) =>
    BackgroundColorData(
      color: json['color'] as String,
      palette: BackgroundColorPalette.fromJson(
          json['palette'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BackgroundColorDataToJson(
        BackgroundColorData instance) =>
    <String, dynamic>{
      'color': instance.color,
      'palette': instance.palette,
    };
