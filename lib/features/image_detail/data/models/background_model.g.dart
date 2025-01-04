// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundAdapter extends TypeAdapter<Background> {
  @override
  final int typeId = 2;

  @override
  Background read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Background(
      id: fields[0] as String,
      type: fields[1] as String,
      imageUrl: fields[2] as String?,
      gradient: (fields[3] as Map?)?.cast<String, dynamic>(),
      title: (fields[4] as Map).cast<String, String>(),
      description: (fields[5] as Map?)?.cast<String, String>(),
      categories: (fields[6] as List).cast<String>(),
      tags: (fields[7] as List).cast<String>(),
      dimensions: (fields[8] as Map?)?.cast<String, int>(),
      textAreas: (fields[9] as List).cast<BackgroundTextArea>(),
      attribution: fields[10] as String?,
      createdAt: fields[11] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Background obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.gradient)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.categories)
      ..writeByte(7)
      ..write(obj.tags)
      ..writeByte(8)
      ..write(obj.dimensions)
      ..writeByte(9)
      ..write(obj.textAreas)
      ..writeByte(10)
      ..write(obj.attribution)
      ..writeByte(11)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
