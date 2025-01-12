// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'composition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompositionAdapter extends TypeAdapter<Composition> {
  @override
  final int typeId = 31;

  @override
  Composition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Composition(
      backgroundId: fields[0] as String,
      quoteId: fields[1] as String,
      layout: fields[2] as String,
      aspectRatio: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Composition obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.backgroundId)
      ..writeByte(1)
      ..write(obj.quoteId)
      ..writeByte(2)
      ..write(obj.layout)
      ..writeByte(3)
      ..write(obj.aspectRatio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompositionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Composition _$CompositionFromJson(Map<String, dynamic> json) => Composition(
      backgroundId: json['background_id'] as String,
      quoteId: json['quote_id'] as String,
      layout: json['layout'] as String,
      aspectRatio: json['aspect_ratio'] as String,
    );

Map<String, dynamic> _$CompositionToJson(Composition instance) =>
    <String, dynamic>{
      'background_id': instance.backgroundId,
      'quote_id': instance.quoteId,
      'layout': instance.layout,
      'aspect_ratio': instance.aspectRatio,
    };
