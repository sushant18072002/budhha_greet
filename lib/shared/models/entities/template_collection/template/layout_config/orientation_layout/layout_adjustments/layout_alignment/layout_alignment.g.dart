// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_alignment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LayoutAlignmentAdapter extends TypeAdapter<LayoutAlignment> {
  @override
  final int typeId = 100;

  @override
  LayoutAlignment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LayoutAlignment(
      title: fields[0] as String,
      quote: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LayoutAlignment obj) {
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
      other is LayoutAlignmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutAlignment _$LayoutAlignmentFromJson(Map<String, dynamic> json) =>
    LayoutAlignment(
      title: json['title'] as String,
      quote: json['quote'] as String,
    );

Map<String, dynamic> _$LayoutAlignmentToJson(LayoutAlignment instance) =>
    <String, dynamic>{
      'title': instance.title,
      'quote': instance.quote,
    };
