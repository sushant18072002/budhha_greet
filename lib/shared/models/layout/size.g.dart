// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SizeAdapter extends TypeAdapter<Size> {
  @override
  final int typeId = 36;

  @override
  Size read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Size(
      width: fields[0] as double,
      height: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Size obj) {
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

Size _$SizeFromJson(Map<String, dynamic> json) => Size(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );

Map<String, dynamic> _$SizeToJson(Size instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
