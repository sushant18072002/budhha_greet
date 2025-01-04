// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemplateAdapter extends TypeAdapter<Template> {
  @override
  final int typeId = 5;

  @override
  Template read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Template(
      id: fields[0] as String,
      title: (fields[1] as Map).cast<String, String>(),
      description: (fields[2] as Map).cast<String, String>(),
      backgroundId: fields[3] as String,
      quoteId: fields[4] as String?,
      greeting: (fields[5] as Map).cast<String, String>(),
      style: fields[6] as TemplateStyle,
      categories: (fields[7] as List).cast<String>(),
      occasions: (fields[8] as List).cast<String>(),
      isPremium: fields[9] as bool,
      createdAt: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Template obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.backgroundId)
      ..writeByte(4)
      ..write(obj.quoteId)
      ..writeByte(5)
      ..write(obj.greeting)
      ..writeByte(6)
      ..write(obj.style)
      ..writeByte(7)
      ..write(obj.categories)
      ..writeByte(8)
      ..write(obj.occasions)
      ..writeByte(9)
      ..write(obj.isPremium)
      ..writeByte(10)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
