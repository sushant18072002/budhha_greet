// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundAdapter extends TypeAdapter<Background> {
  @override
  final int typeId = 9;

  @override
  Background read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Background(
      uuid: fields[0] as String,
      id: fields[1] as String,
      type: fields[2] as String,
      translations: (fields[3] as Map).cast<String, BackGroundTranslation>(),
      visualData: fields[4] as VisualData,
      visualEffects: fields[5] as VisualEffects,
      categoryIds: (fields[6] as List).cast<String>(),
      tagIds: (fields[7] as List).cast<String>(),
      attribution: fields[8] as Attribution,
      optimization: fields[9] as Optimization,
      cacheConfig: fields[10] as CacheConfig,
      audit: fields[11] as Audit,
    );
  }

  @override
  void write(BinaryWriter writer, Background obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.translations)
      ..writeByte(4)
      ..write(obj.visualData)
      ..writeByte(5)
      ..write(obj.visualEffects)
      ..writeByte(6)
      ..write(obj.categoryIds)
      ..writeByte(7)
      ..write(obj.tagIds)
      ..writeByte(8)
      ..write(obj.attribution)
      ..writeByte(9)
      ..write(obj.optimization)
      ..writeByte(10)
      ..write(obj.cacheConfig)
      ..writeByte(11)
      ..write(obj.audit);
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

class ImageDataAdapter extends TypeAdapter<ImageData> {
  @override
  final int typeId = 19;

  @override
  ImageData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageData(
      original: fields[0] as String,
      thumbnail: fields[1] as String,
      placeholder: fields[2] as String,
      variants: (fields[3] as List).cast<ImageVariant>(),
    );
  }

  @override
  void write(BinaryWriter writer, ImageData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.original)
      ..writeByte(1)
      ..write(obj.thumbnail)
      ..writeByte(2)
      ..write(obj.placeholder)
      ..writeByte(3)
      ..write(obj.variants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageVariantAdapter extends TypeAdapter<ImageVariant> {
  @override
  final int typeId = 20;

  @override
  ImageVariant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageVariant(
      width: fields[0] as int,
      height: fields[1] as int,
      path: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageVariant obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.width)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageVariantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GradientDataAdapter extends TypeAdapter<GradientData> {
  @override
  final int typeId = 21;

  @override
  GradientData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GradientData(
      colors: (fields[0] as List).cast<String>(),
      type: fields[1] as String,
      angle: fields[2] as double,
      stops: (fields[3] as List).cast<GradientStop>(),
    );
  }

  @override
  void write(BinaryWriter writer, GradientData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.colors)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.angle)
      ..writeByte(3)
      ..write(obj.stops);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GradientDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GradientStopAdapter extends TypeAdapter<GradientStop> {
  @override
  final int typeId = 22;

  @override
  GradientStop read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GradientStop(
      position: fields[0] as double,
      color: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GradientStop obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.position)
      ..writeByte(1)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GradientStopAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ColorDataAdapter extends TypeAdapter<ColorData> {
  @override
  final int typeId = 23;

  @override
  ColorData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColorData(
      color: fields[0] as String,
      palette: fields[1] as ColorPalette,
    );
  }

  @override
  void write(BinaryWriter writer, ColorData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.palette);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ColorPaletteAdapter extends TypeAdapter<ColorPalette> {
  @override
  final int typeId = 24;

  @override
  ColorPalette read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColorPalette(
      light: fields[0] as String,
      dark: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ColorPalette obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.light)
      ..writeByte(1)
      ..write(obj.dark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorPaletteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AttributionAdapter extends TypeAdapter<Attribution> {
  @override
  final int typeId = 26;

  @override
  Attribution read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attribution(
      photographer: fields[0] as String?,
      license: fields[1] as String,
      url: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Attribution obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.photographer)
      ..writeByte(1)
      ..write(obj.license)
      ..writeByte(2)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttributionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OptimizationAdapter extends TypeAdapter<Optimization> {
  @override
  final int typeId = 27;

  @override
  Optimization read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Optimization(
      formats: (fields[0] as List).cast<String>(),
      quality: fields[1] as int,
      placeholder: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Optimization obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.formats)
      ..writeByte(1)
      ..write(obj.quality)
      ..writeByte(2)
      ..write(obj.placeholder);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptimizationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BackgroundCollectionAdapter extends TypeAdapter<BackgroundCollection> {
  @override
  final int typeId = 63;

  @override
  BackgroundCollection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundCollection(
      schema: fields[0] as BackgroundSchema,
      data: (fields[1] as List).cast<Background>(),
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundCollection obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.schema)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundCollectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BackgroundSchemaAdapter extends TypeAdapter<BackgroundSchema> {
  @override
  final int typeId = 64;

  @override
  BackgroundSchema read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundSchema(
      type: fields[0] as String,
      indexes: (fields[1] as List).cast<String>(),
      required: (fields[2] as List).cast<String>(),
      unique: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundSchema obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.indexes)
      ..writeByte(2)
      ..write(obj.required)
      ..writeByte(3)
      ..write(obj.unique);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundSchemaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BackGroundTranslationAdapter extends TypeAdapter<BackGroundTranslation> {
  @override
  final int typeId = 80;

  @override
  BackGroundTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackGroundTranslation(
      title: fields[0] as String,
      description: fields[1] as String?,
      semanticLabel: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BackGroundTranslation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.semanticLabel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackGroundTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Background _$BackgroundFromJson(Map<String, dynamic> json) => Background(
      uuid: json['uuid'] as String,
      id: json['id'] as String,
      type: json['type'] as String,
      translations: (json['translations'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, BackGroundTranslation.fromJson(e as Map<String, dynamic>)),
      ),
      visualData:
          VisualData.fromJson(json['visual_data'] as Map<String, dynamic>),
      visualEffects: VisualEffects.fromJson(
          json['visual_effects'] as Map<String, dynamic>),
      categoryIds: (json['category_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tagIds:
          (json['tag_ids'] as List<dynamic>).map((e) => e as String).toList(),
      attribution:
          Attribution.fromJson(json['attribution'] as Map<String, dynamic>),
      optimization:
          Optimization.fromJson(json['optimization'] as Map<String, dynamic>),
      cacheConfig:
          CacheConfig.fromJson(json['cache_config'] as Map<String, dynamic>),
      audit: Audit.fromJson(json['audit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BackgroundToJson(Background instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'id': instance.id,
      'type': instance.type,
      'translations': instance.translations,
      'visual_data': instance.visualData,
      'visual_effects': instance.visualEffects,
      'category_ids': instance.categoryIds,
      'tag_ids': instance.tagIds,
      'attribution': instance.attribution,
      'optimization': instance.optimization,
      'cache_config': instance.cacheConfig,
      'audit': instance.audit,
    };

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
      original: json['original'] as String,
      thumbnail: json['thumbnail'] as String,
      placeholder: json['placeholder'] as String,
      variants: (json['variants'] as List<dynamic>)
          .map((e) => ImageVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'original': instance.original,
      'thumbnail': instance.thumbnail,
      'placeholder': instance.placeholder,
      'variants': instance.variants,
    };

ImageVariant _$ImageVariantFromJson(Map<String, dynamic> json) => ImageVariant(
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      path: json['path'] as String,
    );

Map<String, dynamic> _$ImageVariantToJson(ImageVariant instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'path': instance.path,
    };

GradientData _$GradientDataFromJson(Map<String, dynamic> json) => GradientData(
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
      type: json['type'] as String,
      angle: (json['angle'] as num).toDouble(),
      stops: (json['stops'] as List<dynamic>)
          .map((e) => GradientStop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GradientDataToJson(GradientData instance) =>
    <String, dynamic>{
      'colors': instance.colors,
      'type': instance.type,
      'angle': instance.angle,
      'stops': instance.stops,
    };

GradientStop _$GradientStopFromJson(Map<String, dynamic> json) => GradientStop(
      position: (json['position'] as num).toDouble(),
      color: json['color'] as String,
    );

Map<String, dynamic> _$GradientStopToJson(GradientStop instance) =>
    <String, dynamic>{
      'position': instance.position,
      'color': instance.color,
    };

ColorData _$ColorDataFromJson(Map<String, dynamic> json) => ColorData(
      color: json['color'] as String,
      palette: ColorPalette.fromJson(json['palette'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ColorDataToJson(ColorData instance) => <String, dynamic>{
      'color': instance.color,
      'palette': instance.palette,
    };

ColorPalette _$ColorPaletteFromJson(Map<String, dynamic> json) => ColorPalette(
      light: json['light'] as String,
      dark: json['dark'] as String,
    );

Map<String, dynamic> _$ColorPaletteToJson(ColorPalette instance) =>
    <String, dynamic>{
      'light': instance.light,
      'dark': instance.dark,
    };

Attribution _$AttributionFromJson(Map<String, dynamic> json) => Attribution(
      photographer: json['photographer'] as String?,
      license: json['license'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AttributionToJson(Attribution instance) =>
    <String, dynamic>{
      'photographer': instance.photographer,
      'license': instance.license,
      'url': instance.url,
    };

Optimization _$OptimizationFromJson(Map<String, dynamic> json) => Optimization(
      formats:
          (json['formats'] as List<dynamic>).map((e) => e as String).toList(),
      quality: (json['quality'] as num).toInt(),
      placeholder: json['placeholder'] as String,
    );

Map<String, dynamic> _$OptimizationToJson(Optimization instance) =>
    <String, dynamic>{
      'formats': instance.formats,
      'quality': instance.quality,
      'placeholder': instance.placeholder,
    };

BackgroundCollection _$BackgroundCollectionFromJson(
        Map<String, dynamic> json) =>
    BackgroundCollection(
      schema: BackgroundSchema.fromJson(json['schema'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Background.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BackgroundCollectionToJson(
        BackgroundCollection instance) =>
    <String, dynamic>{
      'schema': instance.schema,
      'data': instance.data,
    };

BackgroundSchema _$BackgroundSchemaFromJson(Map<String, dynamic> json) =>
    BackgroundSchema(
      type: json['type'] as String,
      indexes:
          (json['indexes'] as List<dynamic>).map((e) => e as String).toList(),
      required:
          (json['required'] as List<dynamic>).map((e) => e as String).toList(),
      unique:
          (json['unique'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BackgroundSchemaToJson(BackgroundSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'indexes': instance.indexes,
      'required': instance.required,
      'unique': instance.unique,
    };

BackGroundTranslation _$BackGroundTranslationFromJson(
        Map<String, dynamic> json) =>
    BackGroundTranslation(
      title: json['title'] as String,
      description: json['description'] as String?,
      semanticLabel: json['semantic_label'] as String?,
    );

Map<String, dynamic> _$BackGroundTranslationToJson(
        BackGroundTranslation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'semantic_label': instance.semanticLabel,
    };
