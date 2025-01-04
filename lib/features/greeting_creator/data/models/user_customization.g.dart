// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_customization.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCustomizationAdapter extends TypeAdapter<UserCustomization> {
  @override
  final int typeId = 9;

  @override
  UserCustomization read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCustomization(
      id: fields[0] as String,
      templateId: fields[1] as String,
      backgroundId: fields[2] as String,
      quoteId: fields[3] as String?,
      greetingStyle: (fields[4] as Map).cast<String, dynamic>(),
      quoteStyle: (fields[5] as Map).cast<String, dynamic>(),
      customGreeting: (fields[6] as Map).cast<String, String>(),
      createdAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, UserCustomization obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.templateId)
      ..writeByte(2)
      ..write(obj.backgroundId)
      ..writeByte(3)
      ..write(obj.quoteId)
      ..writeByte(4)
      ..write(obj.greetingStyle)
      ..writeByte(5)
      ..write(obj.quoteStyle)
      ..writeByte(6)
      ..write(obj.customGreeting)
      ..writeByte(7)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCustomizationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TextPositionAdapter extends TypeAdapter<TextPosition> {
  @override
  final int typeId = 4;

  @override
  TextPosition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TextPosition(
      x: fields[0] as double,
      y: fields[1] as double,
      width: fields[2] as double,
      height: fields[3] as double,
      rotation: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TextPosition obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.x)
      ..writeByte(1)
      ..write(obj.y)
      ..writeByte(2)
      ..write(obj.width)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.rotation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextPositionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TextPlacementZonesAdapter extends TypeAdapter<TextPlacementZones> {
  @override
  final int typeId = 5;

  @override
  TextPlacementZones read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TextPlacementZones(
      greeting: (fields[0] as Map).cast<String, TextPosition>(),
      quote: (fields[1] as Map).cast<String, TextPosition>(),
    );
  }

  @override
  void write(BinaryWriter writer, TextPlacementZones obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.greeting)
      ..writeByte(1)
      ..write(obj.quote);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextPlacementZonesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuoteStyleAdapter extends TypeAdapter<QuoteStyle> {
  @override
  final int typeId = 6;

  @override
  QuoteStyle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuoteStyle(
      x: fields[0] as double,
      y: fields[1] as double,
      fontSize: fields[2] as double,
      fontFamily: fields[3] as String,
      colorHex: fields[4] as String,
      rotation: fields[5] as double,
      effects: (fields[6] as List).cast<String>(),
      positions: (fields[7] as Map).cast<String, TextPosition>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuoteStyle obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.x)
      ..writeByte(1)
      ..write(obj.y)
      ..writeByte(2)
      ..write(obj.fontSize)
      ..writeByte(3)
      ..write(obj.fontFamily)
      ..writeByte(4)
      ..write(obj.colorHex)
      ..writeByte(5)
      ..write(obj.rotation)
      ..writeByte(6)
      ..write(obj.effects)
      ..writeByte(7)
      ..write(obj.positions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuoteStyleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
