// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orientation_layout.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrientationLayoutAdapter extends TypeAdapter<OrientationLayout> {
  @override
  final int typeId = 33;

  @override
  OrientationLayout read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrientationLayout(
      title: fields[0] as ElementLayout,
      quote: fields[1] as ElementLayout,
      layoutAdjustments: fields[2] as LayoutAdjustments?,
      responsiveBehavior: fields[3] as ResponsiveBehavior?,
    );
  }

  @override
  void write(BinaryWriter writer, OrientationLayout obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.quote)
      ..writeByte(2)
      ..write(obj.layoutAdjustments)
      ..writeByte(3)
      ..write(obj.responsiveBehavior);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrientationLayoutAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrientationLayout _$OrientationLayoutFromJson(Map<String, dynamic> json) =>
    OrientationLayout(
      title: ElementLayout.fromJson(json['title'] as Map<String, dynamic>),
      quote: ElementLayout.fromJson(json['quote'] as Map<String, dynamic>),
      layoutAdjustments: json['layout_adjustments'] == null
          ? null
          : LayoutAdjustments.fromJson(
              json['layout_adjustments'] as Map<String, dynamic>),
      responsiveBehavior: json['responsive_behavior'] == null
          ? null
          : ResponsiveBehavior.fromJson(
              json['responsive_behavior'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrientationLayoutToJson(OrientationLayout instance) =>
    <String, dynamic>{
      'title': instance.title,
      'quote': instance.quote,
      'layout_adjustments': instance.layoutAdjustments,
      'responsive_behavior': instance.responsiveBehavior,
    };
