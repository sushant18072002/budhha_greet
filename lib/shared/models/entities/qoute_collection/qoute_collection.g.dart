// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qoute_collection.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuoteCollectionAdapter extends TypeAdapter<QuoteCollection> {
  @override
  final int typeId = 77;

  @override
  QuoteCollection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuoteCollection(
      data: (fields[0] as List).cast<Quote>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuoteCollection obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuoteCollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteCollection _$QuoteCollectionFromJson(Map<String, dynamic> json) =>
    QuoteCollection(
      data: (json['data'] as List<dynamic>)
          .map((e) => Quote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuoteCollectionToJson(QuoteCollection instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
