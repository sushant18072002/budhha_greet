// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_size.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutSizeAdapter extends TypeAdapter<LayoutSize> {
  @override
  final int typeId = 36;

  @override
  LayoutSize read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutSize(
      width: fields[0] as double,
      height: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutSize obj) {
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
      other is LayoutSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutSize _$LayoutSizeFromJson(Map<String, dynamic> json) => LayoutSize(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );

Map<String, dynamic> _$LayoutSizeToJson(LayoutSize instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
