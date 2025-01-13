// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_area.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SafeAreaAdapter extends TypeAdapter<SafeArea> {
  @override
  final int typeId = 37;

  @override
  SafeArea read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SafeArea(
      top: fields[0] as double,
      bottom: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SafeArea obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.top)
      ..writeByte(1)
      ..write(obj.bottom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SafeAreaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SafeArea _$SafeAreaFromJson(Map<String, dynamic> json) => SafeArea(
      top: (json['top'] as num).toDouble(),
      bottom: (json['bottom'] as num).toDouble(),
    );

Map<String, dynamic> _$SafeAreaToJson(SafeArea instance) => <String, dynamic>{
      'top': instance.top,
      'bottom': instance.bottom,
    };
