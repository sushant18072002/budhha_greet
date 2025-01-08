// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularItemsAdapter extends TypeAdapter<PopularItems> {
  @override
  final int typeId = 50;

  @override
  PopularItems read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularItems(
      templateIds: (fields[0] as List).cast<String>(),
      quoteIds: (fields[1] as List).cast<String>(),
      backgroundIds: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PopularItems obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.templateIds)
      ..writeByte(1)
      ..write(obj.quoteIds)
      ..writeByte(2)
      ..write(obj.backgroundIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularItems _$PopularItemsFromJson(Map<String, dynamic> json) => PopularItems(
      templateIds: (json['templateIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      quoteIds:
          (json['quoteIds'] as List<dynamic>).map((e) => e as String).toList(),
      backgroundIds: (json['backgroundIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PopularItemsToJson(PopularItems instance) =>
    <String, dynamic>{
      'templateIds': instance.templateIds,
      'quoteIds': instance.quoteIds,
      'backgroundIds': instance.backgroundIds,
    };
