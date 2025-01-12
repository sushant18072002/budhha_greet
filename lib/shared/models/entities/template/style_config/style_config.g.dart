// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'style_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StyleConfigAdapter extends TypeAdapter<StyleConfig> {
  @override
  final int typeId = 38;

  @override
  StyleConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StyleConfig(
      common: fields[0] as CommonStyle,
      title: fields[1] as ElementStyle,
      quote: fields[2] as ElementStyle,
      actionButtons: fields[3] as ActionButtons,
    );
  }

  @override
  void write(BinaryWriter writer, StyleConfig obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.common)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.quote)
      ..writeByte(3)
      ..write(obj.actionButtons);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StyleConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StyleConfig _$StyleConfigFromJson(Map<String, dynamic> json) => StyleConfig(
      common: CommonStyle.fromJson(json['common'] as Map<String, dynamic>),
      title: ElementStyle.fromJson(json['title'] as Map<String, dynamic>),
      quote: ElementStyle.fromJson(json['quote'] as Map<String, dynamic>),
      actionButtons: ActionButtons.fromJson(
          json['action_buttons'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StyleConfigToJson(StyleConfig instance) =>
    <String, dynamic>{
      'common': instance.common,
      'title': instance.title,
      'quote': instance.quote,
      'action_buttons': instance.actionButtons,
    };
