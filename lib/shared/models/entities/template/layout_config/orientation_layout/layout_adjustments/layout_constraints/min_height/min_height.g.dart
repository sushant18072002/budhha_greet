// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'min_height.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MinHeightAdapter extends TypeAdapter<MinHeight> {
  @override
  final int typeId = 103;

  @override
  MinHeight read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MinHeight(
      title: fields[0] as double,
      quote: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MinHeight obj) {
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
      other is MinHeightAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinHeight _$MinHeightFromJson(Map<String, dynamic> json) => MinHeight(
      title: (json['title'] as num).toDouble(),
      quote: (json['quote'] as num).toDouble(),
    );

Map<String, dynamic> _$MinHeightToJson(MinHeight instance) => <String, dynamic>{
      'title': instance.title,
      'quote': instance.quote,
    };
