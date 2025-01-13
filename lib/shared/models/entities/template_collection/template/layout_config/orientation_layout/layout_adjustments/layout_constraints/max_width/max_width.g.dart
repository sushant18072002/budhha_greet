// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'max_width.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaxWidthAdapter extends TypeAdapter<MaxWidth> {
  @override
  final int typeId = 102;

  @override
  MaxWidth read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MaxWidth(
      title: fields[0] as double,
      quote: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MaxWidth obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.quote);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaxWidthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaxWidth _$MaxWidthFromJson(Map<String, dynamic> json) => MaxWidth(
      title: (json['title'] as num).toDouble(),
      quote: (json['quote'] as num).toDouble(),
    );

Map<String, dynamic> _$MaxWidthToJson(MaxWidth instance) => <String, dynamic>{
      'title': instance.title,
      'quote': instance.quote,
    };
