// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SizeAdapter extends TypeAdapter<CustomSize> {
  @override
  final int typeId = 36;

  @override
  CustomSize read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomSize(
      width: fields[0] as double,
      height: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CustomSize obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.width)
      ..writeByte(1)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomSize _$SizeFromJson(Map<String, dynamic> json) => CustomSize(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );

Map<String, dynamic> _$SizeToJson(CustomSize instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
