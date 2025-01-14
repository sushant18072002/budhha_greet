// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'template_all_extra.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class TemplateCollectionAdapter extends TypeAdapter<TemplateCollection> {
//   @override
//   final int typeId = 79;

//   @override
//   TemplateCollection read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return TemplateCollection(
//       data: (fields[0] as List).cast<Template>(),
//     );
//   }

//   @override
//   void write(BinaryWriter writer, TemplateCollection obj) {
//     writer
//       ..writeByte(1)
//       ..writeByte(0)
//       ..write(obj.data);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is TemplateCollectionAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class TemplateAdapter extends TypeAdapter<Template> {
//   @override
//   final int typeId = 29;

//   @override
//   Template read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Template(
//       uuid: fields[0] as String,
//       translations: (fields[1] as Map).cast<String, TemplateTranslation>(),
//       composition: fields[2] as TemplateComposition,
//       layoutConfig: fields[3] as LayoutConfig,
//       styleConfig: fields[4] as StyleConfig,
//       responsiveConfig: fields[5] as ResponsiveConfig,
//       categoryIds: (fields[6] as List).cast<String>(),
//       tagIds: (fields[7] as List).cast<String>(),
//       metadata: fields[8] as TemplateMetadata,
//       metrics: fields[9] as Metrics,
//       audit: fields[10] as Audit,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Template obj) {
//     writer
//       ..writeByte(11)
//       ..writeByte(0)
//       ..write(obj.uuid)
//       ..writeByte(1)
//       ..write(obj.translations)
//       ..writeByte(2)
//       ..write(obj.composition)
//       ..writeByte(3)
//       ..write(obj.layoutConfig)
//       ..writeByte(4)
//       ..write(obj.styleConfig)
//       ..writeByte(5)
//       ..write(obj.responsiveConfig)
//       ..writeByte(6)
//       ..write(obj.categoryIds)
//       ..writeByte(7)
//       ..write(obj.tagIds)
//       ..writeByte(8)
//       ..write(obj.metadata)
//       ..writeByte(9)
//       ..write(obj.metrics)
//       ..writeByte(10)
//       ..write(obj.audit);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is TemplateAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class TemplateTranslationAdapter extends TypeAdapter<TemplateTranslation> {
//   @override
//   final int typeId = 30;

//   @override
//   TemplateTranslation read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return TemplateTranslation(
//       title: fields[0] as String,
//       description: fields[1] as String,
//       greeting: fields[2] as String,
//       semanticLabel: fields[3] as String,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, TemplateTranslation obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.title)
//       ..writeByte(1)
//       ..write(obj.description)
//       ..writeByte(2)
//       ..write(obj.greeting)
//       ..writeByte(3)
//       ..write(obj.semanticLabel);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is TemplateTranslationAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class TemplateCompositionAdapter extends TypeAdapter<TemplateComposition> {
//   @override
//   final int typeId = 31;

//   @override
//   TemplateComposition read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return TemplateComposition(
//       backgroundId: fields[0] as String,
//       quoteId: fields[1] as String,
//       layout: fields[2] as String,
//       aspectRatio: fields[3] as String,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, TemplateComposition obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.backgroundId)
//       ..writeByte(1)
//       ..write(obj.quoteId)
//       ..writeByte(2)
//       ..write(obj.layout)
//       ..writeByte(3)
//       ..write(obj.aspectRatio);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is TemplateCompositionAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutConfigAdapter extends TypeAdapter<LayoutConfig> {
//   @override
//   final int typeId = 32;

//   @override
//   LayoutConfig read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutConfig(
//       responsive: fields[0] as bool,
//       breakpoints: fields[1] as LayoutBreakpoints,
//       portrait: fields[2] as OrientationLayout,
//       landscape: fields[3] as OrientationLayout,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutConfig obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.responsive)
//       ..writeByte(1)
//       ..write(obj.breakpoints)
//       ..writeByte(2)
//       ..write(obj.portrait)
//       ..writeByte(3)
//       ..write(obj.landscape);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutConfigAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutBreakpointsAdapter extends TypeAdapter<LayoutBreakpoints> {
//   @override
//   final int typeId = 87;

//   @override
//   LayoutBreakpoints read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutBreakpoints(
//       small: fields[0] as int,
//       medium: fields[1] as int,
//       large: fields[2] as int,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutBreakpoints obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.small)
//       ..writeByte(1)
//       ..write(obj.medium)
//       ..writeByte(2)
//       ..write(obj.large);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutBreakpointsAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class OrientationLayoutAdapter extends TypeAdapter<OrientationLayout> {
//   @override
//   final int typeId = 33;

//   @override
//   OrientationLayout read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return OrientationLayout(
//       title: fields[0] as ElementLayout,
//       quote: fields[1] as ElementLayout,
//       layoutAdjustments: fields[2] as LayoutAdjustments,
//       responsiveBehavior: fields[3] as ResponsiveBehavior,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, OrientationLayout obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.title)
//       ..writeByte(1)
//       ..write(obj.quote)
//       ..writeByte(2)
//       ..write(obj.layoutAdjustments)
//       ..writeByte(3)
//       ..write(obj.responsiveBehavior);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is OrientationLayoutAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutPositionAdapter extends TypeAdapter<LayoutPosition> {
//   @override
//   final int typeId = 35;

//   @override
//   LayoutPosition read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutPosition(
//       x: fields[0] as double,
//       y: fields[1] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutPosition obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.x)
//       ..writeByte(1)
//       ..write(obj.y);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutPositionAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutSafeAreaAdapter extends TypeAdapter<LayoutSafeArea> {
//   @override
//   final int typeId = 37;

//   @override
//   LayoutSafeArea read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutSafeArea(
//       top: fields[0] as double,
//       bottom: fields[1] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutSafeArea obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.top)
//       ..writeByte(1)
//       ..write(obj.bottom);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutSafeAreaAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutSizeAdapter extends TypeAdapter<LayoutSize> {
//   @override
//   final int typeId = 36;

//   @override
//   LayoutSize read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutSize(
//       width: fields[0] as double,
//       height: fields[1] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutSize obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.width)
//       ..writeByte(1)
//       ..write(obj.height);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutSizeAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutVisualEffectsAdapter extends TypeAdapter<LayoutVisualEffects> {
//   @override
//   final int typeId = 86;

//   @override
//   LayoutVisualEffects read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutVisualEffects(
//       blur: fields[0] as LayoutBlur,
//       borderRadius: fields[1] as LayoutBorderRadius,
//       background: fields[2] as LayoutBackground,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutVisualEffects obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.blur)
//       ..writeByte(1)
//       ..write(obj.borderRadius)
//       ..writeByte(2)
//       ..write(obj.background);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutVisualEffectsAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutBackgroundAdapter extends TypeAdapter<LayoutBackground> {
//   @override
//   final int typeId = 84;

//   @override
//   LayoutBackground read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutBackground(
//       opacity: fields[0] as LayoutOpacityConfig,
//       color: fields[1] as String,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutBackground obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.opacity)
//       ..writeByte(1)
//       ..write(obj.color);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutBackgroundAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutOpacityConfigAdapter extends TypeAdapter<LayoutOpacityConfig> {
//   @override
//   final int typeId = 85;

//   @override
//   LayoutOpacityConfig read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutOpacityConfig(
//       base: fields[0] as double,
//       min: fields[1] as double,
//       max: fields[2] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutOpacityConfig obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.base)
//       ..writeByte(1)
//       ..write(obj.min)
//       ..writeByte(2)
//       ..write(obj.max);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutOpacityConfigAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutSigmaValueAdapter extends TypeAdapter<LayoutSigmaValue> {
//   @override
//   final int typeId = 82;

//   @override
//   LayoutSigmaValue read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutSigmaValue(
//       base: fields[0] as double,
//       min: fields[1] as double,
//       max: fields[2] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutSigmaValue obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.base)
//       ..writeByte(1)
//       ..write(obj.min)
//       ..writeByte(2)
//       ..write(obj.max);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutSigmaValueAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutBlurSigmaAdapter extends TypeAdapter<LayoutBlurSigma> {
//   @override
//   final int typeId = 81;

//   @override
//   LayoutBlurSigma read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutBlurSigma(
//       x: fields[0] as LayoutSigmaValue,
//       y: fields[1] as LayoutSigmaValue,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutBlurSigma obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.x)
//       ..writeByte(1)
//       ..write(obj.y);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutBlurSigmaAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutBlurAdapter extends TypeAdapter<LayoutBlur> {
//   @override
//   final int typeId = 80;

//   @override
//   LayoutBlur read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutBlur(
//       enabled: fields[0] as bool,
//       sigma: fields[1] as LayoutBlurSigma,
//       quality: fields[2] as String,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutBlur obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.enabled)
//       ..writeByte(1)
//       ..write(obj.sigma)
//       ..writeByte(2)
//       ..write(obj.quality);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutBlurAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutBorderRadiusAdapter extends TypeAdapter<LayoutBorderRadius> {
//   @override
//   final int typeId = 83;

//   @override
//   LayoutBorderRadius read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutBorderRadius(
//       base: fields[0] as double,
//       min: fields[1] as double,
//       max: fields[2] as double,
//       scaleFactor: fields[3] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutBorderRadius obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.base)
//       ..writeByte(1)
//       ..write(obj.min)
//       ..writeByte(2)
//       ..write(obj.max)
//       ..writeByte(3)
//       ..write(obj.scaleFactor);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutBorderRadiusAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ElementLayoutAdapter extends TypeAdapter<ElementLayout> {
//   @override
//   final int typeId = 34;

//   @override
//   ElementLayout read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ElementLayout(
//       layoutPosition: fields[0] as LayoutPosition,
//       size: fields[1] as LayoutSize,
//       padding: fields[2] as double,
//       safeArea: fields[3] as LayoutSafeArea?,
//       visualEffects: fields[4] as LayoutVisualEffects,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ElementLayout obj) {
//     writer
//       ..writeByte(5)
//       ..writeByte(0)
//       ..write(obj.layoutPosition)
//       ..writeByte(1)
//       ..write(obj.size)
//       ..writeByte(2)
//       ..write(obj.padding)
//       ..writeByte(3)
//       ..write(obj.safeArea)
//       ..writeByte(4)
//       ..write(obj.visualEffects);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ElementLayoutAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutAdjustmentsAdapter extends TypeAdapter<LayoutAdjustments> {
//   @override
//   final int typeId = 98;

//   @override
//   LayoutAdjustments read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutAdjustments(
//       spacing: fields[0] as LayoutSpacing,
//       alignment: fields[1] as LayoutAlignment,
//       constraints: fields[2] as LayoutConstraints,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutAdjustments obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.spacing)
//       ..writeByte(1)
//       ..write(obj.alignment)
//       ..writeByte(2)
//       ..write(obj.constraints);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutAdjustmentsAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutAlignmentAdapter extends TypeAdapter<LayoutAlignment> {
//   @override
//   final int typeId = 100;

//   @override
//   LayoutAlignment read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutAlignment(
//       title: fields[0] as String,
//       quote: fields[1] as String,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutAlignment obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.title)
//       ..writeByte(1)
//       ..write(obj.quote);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutAlignmentAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutConstraintsAdapter extends TypeAdapter<LayoutConstraints> {
//   @override
//   final int typeId = 101;

//   @override
//   LayoutConstraints read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutConstraints(
//       maxWidth: fields[0] as MaxWidth,
//       minHeight: fields[1] as MinHeight,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutConstraints obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.maxWidth)
//       ..writeByte(1)
//       ..write(obj.minHeight);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutConstraintsAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class MaxWidthAdapter extends TypeAdapter<MaxWidth> {
//   @override
//   final int typeId = 102;

//   @override
//   MaxWidth read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return MaxWidth(
//       title: fields[0] as double,
//       quote: fields[1] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, MaxWidth obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.title)
//       ..writeByte(1)
//       ..write(obj.quote);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is MaxWidthAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class MinHeightAdapter extends TypeAdapter<MinHeight> {
//   @override
//   final int typeId = 103;

//   @override
//   MinHeight read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return MinHeight(
//       title: fields[0] as double,
//       quote: fields[1] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, MinHeight obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.title)
//       ..writeByte(1)
//       ..write(obj.quote);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is MinHeightAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class LayoutSpacingAdapter extends TypeAdapter<LayoutSpacing> {
//   @override
//   final int typeId = 99;

//   @override
//   LayoutSpacing read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LayoutSpacing(
//       betweenElements: fields[0] as double,
//       horizontalMargin: fields[1] as double,
//       verticalMargin: fields[2] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LayoutSpacing obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.betweenElements)
//       ..writeByte(1)
//       ..write(obj.horizontalMargin)
//       ..writeByte(2)
//       ..write(obj.verticalMargin);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LayoutSpacingAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ResponsiveBehaviorAdapter extends TypeAdapter<ResponsiveBehavior> {
//   @override
//   final int typeId = 108;

//   @override
//   ResponsiveBehavior read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ResponsiveBehavior(
//       breakpoints: fields[0] as Breakpoints,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ResponsiveBehavior obj) {
//     writer
//       ..writeByte(1)
//       ..writeByte(0)
//       ..write(obj.breakpoints);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ResponsiveBehaviorAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class BreakpointsAdapter extends TypeAdapter<Breakpoints> {
//   @override
//   final int typeId = 108;

//   @override
//   Breakpoints read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Breakpoints(
//       small: fields[0] as ResponsiveBreakpoint,
//       medium: fields[1] as ResponsiveBreakpoint,
//       large: fields[2] as ResponsiveBreakpoint,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Breakpoints obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.small)
//       ..writeByte(1)
//       ..write(obj.medium)
//       ..writeByte(2)
//       ..write(obj.large);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is BreakpointsAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ResponsiveBreakpointAdapter extends TypeAdapter<ResponsiveBreakpoint> {
//   @override
//   final int typeId = 107;

//   @override
//   ResponsiveBreakpoint read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ResponsiveBreakpoint(
//       maxWidth: fields[0] as double,
//       titleScale: fields[1] as double,
//       quoteScale: fields[2] as double,
//       spacingScale: fields[3] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ResponsiveBreakpoint obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.maxWidth)
//       ..writeByte(1)
//       ..write(obj.titleScale)
//       ..writeByte(2)
//       ..write(obj.quoteScale)
//       ..writeByte(3)
//       ..write(obj.spacingScale);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ResponsiveBreakpointAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class StyleConfigAdapter extends TypeAdapter<StyleConfig> {
//   @override
//   final int typeId = 38;

//   @override
//   StyleConfig read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return StyleConfig(
//       common: fields[0] as CommonStyle,
//       title: fields[1] as ElementStyle,
//       quote: fields[2] as ElementStyle,
//       actionButtons: fields[3] as ActionButtons,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, StyleConfig obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.common)
//       ..writeByte(1)
//       ..write(obj.title)
//       ..writeByte(2)
//       ..write(obj.quote)
//       ..writeByte(3)
//       ..write(obj.actionButtons);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is StyleConfigAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ActionButtonsAdapter extends TypeAdapter<ActionButtons> {
//   @override
//   final int typeId = 97;

//   @override
//   ActionButtons read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ActionButtons(
//       size: fields[0] as double,
//       background: fields[1] as ActionBackground,
//       blur: fields[2] as ActionBlur,
//       shadow: fields[3] as ActionShadow,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ActionButtons obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.size)
//       ..writeByte(1)
//       ..write(obj.background)
//       ..writeByte(2)
//       ..write(obj.blur)
//       ..writeByte(3)
//       ..write(obj.shadow);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ActionButtonsAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ActionBackgroundAdapter extends TypeAdapter<ActionBackground> {
//   @override
//   final int typeId = 202;

//   @override
//   ActionBackground read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ActionBackground(
//       opacity: fields[0] as double,
//       color: fields[1] as String,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ActionBackground obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.opacity)
//       ..writeByte(1)
//       ..write(obj.color);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ActionBackgroundAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ActionBlurAdapter extends TypeAdapter<ActionBlur> {
//   @override
//   final int typeId = 203;

//   @override
//   ActionBlur read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ActionBlur(
//       enabled: fields[0] as bool,
//       sigma: fields[1] as ActionSigma,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ActionBlur obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.enabled)
//       ..writeByte(1)
//       ..write(obj.sigma);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ActionBlurAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ActionSigmaAdapter extends TypeAdapter<ActionSigma> {
//   @override
//   final int typeId = 204;

//   @override
//   ActionSigma read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ActionSigma(
//       x: fields[0] as double,
//       y: fields[1] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ActionSigma obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.x)
//       ..writeByte(1)
//       ..write(obj.y);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ActionSigmaAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ActionShadowAdapter extends TypeAdapter<ActionShadow> {
//   @override
//   final int typeId = 205;

//   @override
//   ActionShadow read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ActionShadow(
//       color: fields[0] as String,
//       offset: fields[1] as ActionOffset,
//       blurRadius: fields[2] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ActionShadow obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.color)
//       ..writeByte(1)
//       ..write(obj.offset)
//       ..writeByte(2)
//       ..write(obj.blurRadius);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ActionShadowAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ActionOffsetAdapter extends TypeAdapter<ActionOffset> {
//   @override
//   final int typeId = 206;

//   @override
//   ActionOffset read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ActionOffset(
//       x: fields[0] as double,
//       y: fields[1] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ActionOffset obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.x)
//       ..writeByte(1)
//       ..write(obj.y);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ActionOffsetAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class CommonHoverAnimationAdapter extends TypeAdapter<CommonHoverAnimation> {
//   @override
//   final int typeId = 92;

//   @override
//   CommonHoverAnimation read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return CommonHoverAnimation(
//       scale: fields[0] as double,
//       duration: fields[1] as int,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, CommonHoverAnimation obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.scale)
//       ..writeByte(1)
//       ..write(obj.duration);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is CommonHoverAnimationAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class CommonAnimationsAdapter extends TypeAdapter<CommonAnimations> {
//   @override
//   final int typeId = 91;

//   @override
//   CommonAnimations read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return CommonAnimations(
//       transitionDuration: fields[0] as int,
//       hover: fields[1] as CommonHoverAnimation,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, CommonAnimations obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.transitionDuration)
//       ..writeByte(1)
//       ..write(obj.hover);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is CommonAnimationsAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class CommonGradientStopAdapter extends TypeAdapter<CommonGradientStop> {
//   @override
//   final int typeId = 90;

//   @override
//   CommonGradientStop read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return CommonGradientStop(
//       color: fields[0] as String,
//       position: fields[1] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, CommonGradientStop obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.color)
//       ..writeByte(1)
//       ..write(obj.position);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is CommonGradientStopAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class CommonGradientOverlayAdapter extends TypeAdapter<CommonGradientOverlay> {
//   @override
//   final int typeId = 89;

//   @override
//   CommonGradientOverlay read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return CommonGradientOverlay(
//       enabled: fields[0] as bool,
//       stops: (fields[1] as List).cast<CommonGradientStop>(),
//       angle: fields[2] as int,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, CommonGradientOverlay obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.enabled)
//       ..writeByte(1)
//       ..write(obj.stops)
//       ..writeByte(2)
//       ..write(obj.angle);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is CommonGradientOverlayAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class CommonStyleAdapter extends TypeAdapter<CommonStyle> {
//   @override
//   final int typeId = 88;

//   @override
//   CommonStyle read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return CommonStyle(
//       gradientOverlay: fields[0] as CommonGradientOverlay,
//       animations: fields[1] as CommonAnimations,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, CommonStyle obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.gradientOverlay)
//       ..writeByte(1)
//       ..write(obj.animations);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is CommonStyleAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ElementStyleAdapter extends TypeAdapter<ElementStyle> {
//   @override
//   final int typeId = 30;

//   @override
//   ElementStyle read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ElementStyle(
//       typography: fields[0] as ElementTypography,
//       colors: fields[1] as ElementStyleColors,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ElementStyle obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.typography)
//       ..writeByte(1)
//       ..write(obj.colors);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ElementStyleAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ElementStyleColorsAdapter extends TypeAdapter<ElementStyleColors> {
//   @override
//   final int typeId = 95;

//   @override
//   ElementStyleColors read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ElementStyleColors(
//       text: fields[0] as String,
//       shadow: fields[1] as ElementShadow,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ElementStyleColors obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.text)
//       ..writeByte(1)
//       ..write(obj.shadow);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ElementStyleColorsAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ElementShadowAdapter extends TypeAdapter<ElementShadow> {
//   @override
//   final int typeId = 96;

//   @override
//   ElementShadow read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ElementShadow(
//       color: fields[0] as String,
//       offset: fields[1] as ShadowOffset,
//       blurRadius: fields[2] as double,
//       opacity: fields[3] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ElementShadow obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.color)
//       ..writeByte(1)
//       ..write(obj.offset)
//       ..writeByte(2)
//       ..write(obj.blurRadius)
//       ..writeByte(3)
//       ..write(obj.opacity);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ElementShadowAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ShadowOffsetAdapter extends TypeAdapter<ShadowOffset> {
//   @override
//   final int typeId = 35;

//   @override
//   ShadowOffset read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ShadowOffset(
//       x: fields[0] as double,
//       y: fields[1] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ShadowOffset obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.x)
//       ..writeByte(1)
//       ..write(obj.y);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ShadowOffsetAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ElementTypographyAdapter extends TypeAdapter<ElementTypography> {
//   @override
//   final int typeId = 93;

//   @override
//   ElementTypography read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ElementTypography(
//       fontFamily: fields[0] as String,
//       fontSize: fields[1] as ElementFontSize,
//       fontWeight: fields[2] as String,
//       letterSpacing: fields[3] as double,
//       lineHeight: fields[4] as double,
//       textAlign: fields[5] as String,
//       textTransform: fields[6] as String,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ElementTypography obj) {
//     writer
//       ..writeByte(7)
//       ..writeByte(0)
//       ..write(obj.fontFamily)
//       ..writeByte(1)
//       ..write(obj.fontSize)
//       ..writeByte(2)
//       ..write(obj.fontWeight)
//       ..writeByte(3)
//       ..write(obj.letterSpacing)
//       ..writeByte(4)
//       ..write(obj.lineHeight)
//       ..writeByte(5)
//       ..write(obj.textAlign)
//       ..writeByte(6)
//       ..write(obj.textTransform);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ElementTypographyAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ElementFontSizeAdapter extends TypeAdapter<ElementFontSize> {
//   @override
//   final int typeId = 94;

//   @override
//   ElementFontSize read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ElementFontSize(
//       base: fields[0] as double,
//       min: fields[1] as double,
//       max: fields[2] as double,
//       scale: fields[3] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ElementFontSize obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.base)
//       ..writeByte(1)
//       ..write(obj.min)
//       ..writeByte(2)
//       ..write(obj.max)
//       ..writeByte(3)
//       ..write(obj.scale);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ElementFontSizeAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class TemplateMetadataAdapter extends TypeAdapter<TemplateMetadata> {
//   @override
//   final int typeId = 40;

//   @override
//   TemplateMetadata read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return TemplateMetadata(
//       isPremium: fields[0] as bool,
//       status: fields[1] as String,
//       version: fields[2] as int,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, TemplateMetadata obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.isPremium)
//       ..writeByte(1)
//       ..write(obj.status)
//       ..writeByte(2)
//       ..write(obj.version);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is TemplateMetadataAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class ResponsiveConfigAdapter extends TypeAdapter<ResponsiveConfig> {
//   @override
//   final int typeId = 104;

//   @override
//   ResponsiveConfig read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ResponsiveConfig(
//       gridConfig: fields[0] as GridConfig,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, ResponsiveConfig obj) {
//     writer
//       ..writeByte(1)
//       ..writeByte(0)
//       ..write(obj.gridConfig);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ResponsiveConfigAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class GridConfigAdapter extends TypeAdapter<GridConfig> {
//   @override
//   final int typeId = 104;

//   @override
//   GridConfig read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return GridConfig(
//       spacing: fields[0] as GridSpacing,
//       columns: fields[1] as GridColumns,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, GridConfig obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.spacing)
//       ..writeByte(1)
//       ..write(obj.columns);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is GridConfigAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class GridColumnsAdapter extends TypeAdapter<GridColumns> {
//   @override
//   final int typeId = 106;

//   @override
//   GridColumns read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return GridColumns(
//       small: fields[0] as int,
//       medium: fields[1] as int,
//       large: fields[2] as int,
//       xlarge: fields[3] as int,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, GridColumns obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.small)
//       ..writeByte(1)
//       ..write(obj.medium)
//       ..writeByte(2)
//       ..write(obj.large)
//       ..writeByte(3)
//       ..write(obj.xlarge);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is GridColumnsAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class GridSpacingAdapter extends TypeAdapter<GridSpacing> {
//   @override
//   final int typeId = 105;

//   @override
//   GridSpacing read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return GridSpacing(
//       small: fields[0] as double,
//       medium: fields[1] as double,
//       large: fields[2] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, GridSpacing obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.small)
//       ..writeByte(1)
//       ..write(obj.medium)
//       ..writeByte(2)
//       ..write(obj.large);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is GridSpacingAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class AuditAdapter extends TypeAdapter<Audit> {
//   @override
//   final int typeId = 17;

//   @override
//   Audit read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Audit(
//       createdAt: fields[0] as DateTime,
//       createdBy: fields[1] as String,
//       modifiedAt: fields[2] as DateTime,
//       modifiedBy: fields[3] as String,
//       version: fields[4] as int,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Audit obj) {
//     writer
//       ..writeByte(5)
//       ..writeByte(0)
//       ..write(obj.createdAt)
//       ..writeByte(1)
//       ..write(obj.createdBy)
//       ..writeByte(2)
//       ..write(obj.modifiedAt)
//       ..writeByte(3)
//       ..write(obj.modifiedBy)
//       ..writeByte(4)
//       ..write(obj.version);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is AuditAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class MetricsAdapter extends TypeAdapter<Metrics> {
//   @override
//   final int typeId = 16;

//   @override
//   Metrics read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Metrics(
//       views: fields[0] as int,
//       shares: fields[1] as int,
//       favorites: fields[2] as int,
//       lastUsed: fields[3] as DateTime?,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Metrics obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.views)
//       ..writeByte(1)
//       ..write(obj.shares)
//       ..writeByte(2)
//       ..write(obj.favorites)
//       ..writeByte(3)
//       ..write(obj.lastUsed);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is MetricsAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// TemplateCollection _$TemplateCollectionFromJson(Map<String, dynamic> json) =>
//     TemplateCollection(
//       data: (json['data'] as List<dynamic>)
//           .map((e) => Template.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );

// Map<String, dynamic> _$TemplateCollectionToJson(TemplateCollection instance) =>
//     <String, dynamic>{
//       'data': instance.data,
//     };

// Template _$TemplateFromJson(Map<String, dynamic> json) => Template(
//       uuid: json['uuid'] as String,
//       translations: (json['translations'] as Map<String, dynamic>).map(
//         (k, e) => MapEntry(
//             k, TemplateTranslation.fromJson(e as Map<String, dynamic>)),
//       ),
//       composition: TemplateComposition.fromJson(
//           json['composition'] as Map<String, dynamic>),
//       layoutConfig:
//           LayoutConfig.fromJson(json['layout_config'] as Map<String, dynamic>),
//       styleConfig:
//           StyleConfig.fromJson(json['style_config'] as Map<String, dynamic>),
//       responsiveConfig: ResponsiveConfig.fromJson(
//           json['responsive_config'] as Map<String, dynamic>),
//       categoryIds: (json['category_ids'] as List<dynamic>)
//           .map((e) => e as String)
//           .toList(),
//       tagIds:
//           (json['tag_ids'] as List<dynamic>).map((e) => e as String).toList(),
//       metadata:
//           TemplateMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
//       metrics: Metrics.fromJson(json['metrics'] as Map<String, dynamic>),
//       audit: Audit.fromJson(json['audit'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$TemplateToJson(Template instance) => <String, dynamic>{
//       'uuid': instance.uuid,
//       'translations': instance.translations,
//       'composition': instance.composition,
//       'layout_config': instance.layoutConfig,
//       'style_config': instance.styleConfig,
//       'responsive_config': instance.responsiveConfig,
//       'category_ids': instance.categoryIds,
//       'tag_ids': instance.tagIds,
//       'metadata': instance.metadata,
//       'metrics': instance.metrics,
//       'audit': instance.audit,
//     };

// TemplateTranslation _$TemplateTranslationFromJson(Map<String, dynamic> json) =>
//     TemplateTranslation(
//       title: json['title'] as String,
//       description: json['description'] as String,
//       greeting: json['greeting'] as String,
//       semanticLabel: json['semantic_label'] as String,
//     );

// Map<String, dynamic> _$TemplateTranslationToJson(
//         TemplateTranslation instance) =>
//     <String, dynamic>{
//       'title': instance.title,
//       'description': instance.description,
//       'greeting': instance.greeting,
//       'semantic_label': instance.semanticLabel,
//     };

// TemplateComposition _$TemplateCompositionFromJson(Map<String, dynamic> json) =>
//     TemplateComposition(
//       backgroundId: json['background_id'] as String,
//       quoteId: json['quote_id'] as String,
//       layout: json['layout'] as String,
//       aspectRatio: json['aspect_ratio'] as String,
//     );

// Map<String, dynamic> _$TemplateCompositionToJson(
//         TemplateComposition instance) =>
//     <String, dynamic>{
//       'background_id': instance.backgroundId,
//       'quote_id': instance.quoteId,
//       'layout': instance.layout,
//       'aspect_ratio': instance.aspectRatio,
//     };

// LayoutConfig _$LayoutConfigFromJson(Map<String, dynamic> json) => LayoutConfig(
//       responsive: json['responsive'] as bool,
//       breakpoints: LayoutBreakpoints.fromJson(
//           json['breakpoints'] as Map<String, dynamic>),
//       portrait:
//           OrientationLayout.fromJson(json['portrait'] as Map<String, dynamic>),
//       landscape:
//           OrientationLayout.fromJson(json['landscape'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$LayoutConfigToJson(LayoutConfig instance) =>
//     <String, dynamic>{
//       'responsive': instance.responsive,
//       'breakpoints': instance.breakpoints,
//       'portrait': instance.portrait,
//       'landscape': instance.landscape,
//     };

// LayoutBreakpoints _$LayoutBreakpointsFromJson(Map<String, dynamic> json) =>
//     LayoutBreakpoints(
//       small: (json['small'] as num).toInt(),
//       medium: (json['medium'] as num).toInt(),
//       large: (json['large'] as num).toInt(),
//     );

// Map<String, dynamic> _$LayoutBreakpointsToJson(LayoutBreakpoints instance) =>
//     <String, dynamic>{
//       'small': instance.small,
//       'medium': instance.medium,
//       'large': instance.large,
//     };

// OrientationLayout _$OrientationLayoutFromJson(Map<String, dynamic> json) =>
//     OrientationLayout(
//       title: ElementLayout.fromJson(json['title'] as Map<String, dynamic>),
//       quote: ElementLayout.fromJson(json['quote'] as Map<String, dynamic>),
//       layoutAdjustments: LayoutAdjustments.fromJson(
//           json['layout_adjustments'] as Map<String, dynamic>),
//       responsiveBehavior: ResponsiveBehavior.fromJson(
//           json['responsive_behavior'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$OrientationLayoutToJson(OrientationLayout instance) =>
//     <String, dynamic>{
//       'title': instance.title,
//       'quote': instance.quote,
//       'layout_adjustments': instance.layoutAdjustments,
//       'responsive_behavior': instance.responsiveBehavior,
//     };

// LayoutPosition _$LayoutPositionFromJson(Map<String, dynamic> json) =>
//     LayoutPosition(
//       x: (json['x'] as num).toDouble(),
//       y: (json['y'] as num).toDouble(),
//     );

// Map<String, dynamic> _$LayoutPositionToJson(LayoutPosition instance) =>
//     <String, dynamic>{
//       'x': instance.x,
//       'y': instance.y,
//     };

// LayoutSafeArea _$LayoutSafeAreaFromJson(Map<String, dynamic> json) =>
//     LayoutSafeArea(
//       top: (json['top'] as num).toDouble(),
//       bottom: (json['bottom'] as num).toDouble(),
//     );

// Map<String, dynamic> _$LayoutSafeAreaToJson(LayoutSafeArea instance) =>
//     <String, dynamic>{
//       'top': instance.top,
//       'bottom': instance.bottom,
//     };

// LayoutSize _$LayoutSizeFromJson(Map<String, dynamic> json) => LayoutSize(
//       width: (json['width'] as num).toDouble(),
//       height: (json['height'] as num).toDouble(),
//     );

// Map<String, dynamic> _$LayoutSizeToJson(LayoutSize instance) =>
//     <String, dynamic>{
//       'width': instance.width,
//       'height': instance.height,
//     };

// LayoutVisualEffects _$LayoutVisualEffectsFromJson(Map<String, dynamic> json) =>
//     LayoutVisualEffects(
//       blur: LayoutBlur.fromJson(json['blur'] as Map<String, dynamic>),
//       borderRadius: LayoutBorderRadius.fromJson(
//           json['border_radius'] as Map<String, dynamic>),
//       background:
//           LayoutBackground.fromJson(json['background'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$LayoutVisualEffectsToJson(
//         LayoutVisualEffects instance) =>
//     <String, dynamic>{
//       'blur': instance.blur,
//       'border_radius': instance.borderRadius,
//       'background': instance.background,
//     };

// LayoutBackground _$LayoutBackgroundFromJson(Map<String, dynamic> json) =>
//     LayoutBackground(
//       opacity:
//           LayoutOpacityConfig.fromJson(json['opacity'] as Map<String, dynamic>),
//       color: json['color'] as String,
//     );

// Map<String, dynamic> _$LayoutBackgroundToJson(LayoutBackground instance) =>
//     <String, dynamic>{
//       'opacity': instance.opacity,
//       'color': instance.color,
//     };

// LayoutOpacityConfig _$LayoutOpacityConfigFromJson(Map<String, dynamic> json) =>
//     LayoutOpacityConfig(
//       base: (json['base'] as num).toDouble(),
//       min: (json['min'] as num).toDouble(),
//       max: (json['max'] as num).toDouble(),
//     );

// Map<String, dynamic> _$LayoutOpacityConfigToJson(
//         LayoutOpacityConfig instance) =>
//     <String, dynamic>{
//       'base': instance.base,
//       'min': instance.min,
//       'max': instance.max,
//     };

// LayoutSigmaValue _$LayoutSigmaValueFromJson(Map<String, dynamic> json) =>
//     LayoutSigmaValue(
//       base: (json['base'] as num).toDouble(),
//       min: (json['min'] as num).toDouble(),
//       max: (json['max'] as num).toDouble(),
//     );

// Map<String, dynamic> _$LayoutSigmaValueToJson(LayoutSigmaValue instance) =>
//     <String, dynamic>{
//       'base': instance.base,
//       'min': instance.min,
//       'max': instance.max,
//     };

// LayoutBlurSigma _$LayoutBlurSigmaFromJson(Map<String, dynamic> json) =>
//     LayoutBlurSigma(
//       x: LayoutSigmaValue.fromJson(json['x'] as Map<String, dynamic>),
//       y: LayoutSigmaValue.fromJson(json['y'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$LayoutBlurSigmaToJson(LayoutBlurSigma instance) =>
//     <String, dynamic>{
//       'x': instance.x,
//       'y': instance.y,
//     };

// LayoutBlur _$LayoutBlurFromJson(Map<String, dynamic> json) => LayoutBlur(
//       enabled: json['enabled'] as bool,
//       sigma: LayoutBlurSigma.fromJson(json['sigma'] as Map<String, dynamic>),
//       quality: json['quality'] as String,
//     );

// Map<String, dynamic> _$LayoutBlurToJson(LayoutBlur instance) =>
//     <String, dynamic>{
//       'enabled': instance.enabled,
//       'sigma': instance.sigma,
//       'quality': instance.quality,
//     };

// LayoutBorderRadius _$LayoutBorderRadiusFromJson(Map<String, dynamic> json) =>
//     LayoutBorderRadius(
//       base: (json['base'] as num).toDouble(),
//       min: (json['min'] as num).toDouble(),
//       max: (json['max'] as num).toDouble(),
//       scaleFactor: (json['scale_factor'] as num).toDouble(),
//     );

// Map<String, dynamic> _$LayoutBorderRadiusToJson(LayoutBorderRadius instance) =>
//     <String, dynamic>{
//       'base': instance.base,
//       'min': instance.min,
//       'max': instance.max,
//       'scale_factor': instance.scaleFactor,
//     };

// ElementLayout _$ElementLayoutFromJson(Map<String, dynamic> json) =>
//     ElementLayout(
//       layoutPosition:
//           LayoutPosition.fromJson(json['position'] as Map<String, dynamic>),
//       size: LayoutSize.fromJson(json['size'] as Map<String, dynamic>),
//       padding: (json['padding'] as num).toDouble(),
//       safeArea: json['safe_area'] == null
//           ? null
//           : LayoutSafeArea.fromJson(json['safe_area'] as Map<String, dynamic>),
//       visualEffects: LayoutVisualEffects.fromJson(
//           json['visual_effects'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$ElementLayoutToJson(ElementLayout instance) =>
//     <String, dynamic>{
//       'position': instance.layoutPosition,
//       'size': instance.size,
//       'padding': instance.padding,
//       'safe_area': instance.safeArea,
//       'visual_effects': instance.visualEffects,
//     };

// LayoutAdjustments _$LayoutAdjustmentsFromJson(Map<String, dynamic> json) =>
//     LayoutAdjustments(
//       spacing: LayoutSpacing.fromJson(json['spacing'] as Map<String, dynamic>),
//       alignment:
//           LayoutAlignment.fromJson(json['alignment'] as Map<String, dynamic>),
//       constraints: LayoutConstraints.fromJson(
//           json['constraints'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$LayoutAdjustmentsToJson(LayoutAdjustments instance) =>
//     <String, dynamic>{
//       'spacing': instance.spacing,
//       'alignment': instance.alignment,
//       'constraints': instance.constraints,
//     };

// LayoutAlignment _$LayoutAlignmentFromJson(Map<String, dynamic> json) =>
//     LayoutAlignment(
//       title: json['title'] as String,
//       quote: json['quote'] as String,
//     );

// Map<String, dynamic> _$LayoutAlignmentToJson(LayoutAlignment instance) =>
//     <String, dynamic>{
//       'title': instance.title,
//       'quote': instance.quote,
//     };

// LayoutConstraints _$LayoutConstraintsFromJson(Map<String, dynamic> json) =>
//     LayoutConstraints(
//       maxWidth: MaxWidth.fromJson(json['max_width'] as Map<String, dynamic>),
//       minHeight: MinHeight.fromJson(json['min_height'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$LayoutConstraintsToJson(LayoutConstraints instance) =>
//     <String, dynamic>{
//       'max_width': instance.maxWidth,
//       'min_height': instance.minHeight,
//     };

// MaxWidth _$MaxWidthFromJson(Map<String, dynamic> json) => MaxWidth(
//       title: (json['title'] as num).toDouble(),
//       quote: (json['quote'] as num).toDouble(),
//     );

// Map<String, dynamic> _$MaxWidthToJson(MaxWidth instance) => <String, dynamic>{
//       'title': instance.title,
//       'quote': instance.quote,
//     };

// MinHeight _$MinHeightFromJson(Map<String, dynamic> json) => MinHeight(
//       title: (json['title'] as num).toDouble(),
//       quote: (json['quote'] as num).toDouble(),
//     );

// Map<String, dynamic> _$MinHeightToJson(MinHeight instance) => <String, dynamic>{
//       'title': instance.title,
//       'quote': instance.quote,
//     };

// LayoutSpacing _$LayoutSpacingFromJson(Map<String, dynamic> json) =>
//     LayoutSpacing(
//       betweenElements: (json['between_elements'] as num).toDouble(),
//       horizontalMargin: (json['horizontal_margin'] as num).toDouble(),
//       verticalMargin: (json['vertical_margin'] as num).toDouble(),
//     );

// Map<String, dynamic> _$LayoutSpacingToJson(LayoutSpacing instance) =>
//     <String, dynamic>{
//       'between_elements': instance.betweenElements,
//       'horizontal_margin': instance.horizontalMargin,
//       'vertical_margin': instance.verticalMargin,
//     };

// ResponsiveBehavior _$ResponsiveBehaviorFromJson(Map<String, dynamic> json) =>
//     ResponsiveBehavior(
//       breakpoints:
//           Breakpoints.fromJson(json['breakpoints'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$ResponsiveBehaviorToJson(ResponsiveBehavior instance) =>
//     <String, dynamic>{
//       'breakpoints': instance.breakpoints,
//     };

// Breakpoints _$BreakpointsFromJson(Map<String, dynamic> json) => Breakpoints(
//       small:
//           ResponsiveBreakpoint.fromJson(json['small'] as Map<String, dynamic>),
//       medium:
//           ResponsiveBreakpoint.fromJson(json['medium'] as Map<String, dynamic>),
//       large:
//           ResponsiveBreakpoint.fromJson(json['large'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$BreakpointsToJson(Breakpoints instance) =>
//     <String, dynamic>{
//       'small': instance.small,
//       'medium': instance.medium,
//       'large': instance.large,
//     };

// ResponsiveBreakpoint _$ResponsiveBreakpointFromJson(
//         Map<String, dynamic> json) =>
//     ResponsiveBreakpoint(
//       maxWidth: (json['max_width'] as num).toDouble(),
//       titleScale: (json['title_scale'] as num).toDouble(),
//       quoteScale: (json['quote_scale'] as num).toDouble(),
//       spacingScale: (json['spacing_scale'] as num).toDouble(),
//     );

// Map<String, dynamic> _$ResponsiveBreakpointToJson(
//         ResponsiveBreakpoint instance) =>
//     <String, dynamic>{
//       'max_width': instance.maxWidth,
//       'title_scale': instance.titleScale,
//       'quote_scale': instance.quoteScale,
//       'spacing_scale': instance.spacingScale,
//     };

// StyleConfig _$StyleConfigFromJson(Map<String, dynamic> json) => StyleConfig(
//       common: CommonStyle.fromJson(json['common'] as Map<String, dynamic>),
//       title: ElementStyle.fromJson(json['title'] as Map<String, dynamic>),
//       quote: ElementStyle.fromJson(json['quote'] as Map<String, dynamic>),
//       actionButtons: ActionButtons.fromJson(
//           json['action_buttons'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$StyleConfigToJson(StyleConfig instance) =>
//     <String, dynamic>{
//       'common': instance.common,
//       'title': instance.title,
//       'quote': instance.quote,
//       'action_buttons': instance.actionButtons,
//     };

// ActionButtons _$ActionButtonsFromJson(Map<String, dynamic> json) =>
//     ActionButtons(
//       size: (json['size'] as num).toDouble(),
//       background:
//           ActionBackground.fromJson(json['background'] as Map<String, dynamic>),
//       blur: ActionBlur.fromJson(json['blur'] as Map<String, dynamic>),
//       shadow: ActionShadow.fromJson(json['shadow'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$ActionButtonsToJson(ActionButtons instance) =>
//     <String, dynamic>{
//       'size': instance.size,
//       'background': instance.background,
//       'blur': instance.blur,
//       'shadow': instance.shadow,
//     };

// ActionBackground _$ActionBackgroundFromJson(Map<String, dynamic> json) =>
//     ActionBackground(
//       opacity: (json['opacity'] as num).toDouble(),
//       color: json['color'] as String,
//     );

// Map<String, dynamic> _$ActionBackgroundToJson(ActionBackground instance) =>
//     <String, dynamic>{
//       'opacity': instance.opacity,
//       'color': instance.color,
//     };

// ActionBlur _$ActionBlurFromJson(Map<String, dynamic> json) => ActionBlur(
//       enabled: json['enabled'] as bool,
//       sigma: ActionSigma.fromJson(json['sigma'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$ActionBlurToJson(ActionBlur instance) =>
//     <String, dynamic>{
//       'enabled': instance.enabled,
//       'sigma': instance.sigma,
//     };

// ActionSigma _$ActionSigmaFromJson(Map<String, dynamic> json) => ActionSigma(
//       x: (json['x'] as num).toDouble(),
//       y: (json['y'] as num).toDouble(),
//     );

// Map<String, dynamic> _$ActionSigmaToJson(ActionSigma instance) =>
//     <String, dynamic>{
//       'x': instance.x,
//       'y': instance.y,
//     };

// ActionShadow _$ActionShadowFromJson(Map<String, dynamic> json) => ActionShadow(
//       color: json['color'] as String,
//       offset: ActionOffset.fromJson(json['offset'] as Map<String, dynamic>),
//       blurRadius: (json['blurRadius'] as num).toDouble(),
//     );

// Map<String, dynamic> _$ActionShadowToJson(ActionShadow instance) =>
//     <String, dynamic>{
//       'color': instance.color,
//       'offset': instance.offset,
//       'blurRadius': instance.blurRadius,
//     };

// ActionOffset _$ActionOffsetFromJson(Map<String, dynamic> json) => ActionOffset(
//       x: (json['x'] as num).toDouble(),
//       y: (json['y'] as num).toDouble(),
//     );

// Map<String, dynamic> _$ActionOffsetToJson(ActionOffset instance) =>
//     <String, dynamic>{
//       'x': instance.x,
//       'y': instance.y,
//     };

// CommonHoverAnimation _$CommonHoverAnimationFromJson(
//         Map<String, dynamic> json) =>
//     CommonHoverAnimation(
//       scale: (json['scale'] as num).toDouble(),
//       duration: (json['duration'] as num).toInt(),
//     );

// Map<String, dynamic> _$CommonHoverAnimationToJson(
//         CommonHoverAnimation instance) =>
//     <String, dynamic>{
//       'scale': instance.scale,
//       'duration': instance.duration,
//     };

// CommonAnimations _$CommonAnimationsFromJson(Map<String, dynamic> json) =>
//     CommonAnimations(
//       transitionDuration: (json['transition_duration'] as num).toInt(),
//       hover:
//           CommonHoverAnimation.fromJson(json['hover'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$CommonAnimationsToJson(CommonAnimations instance) =>
//     <String, dynamic>{
//       'transition_duration': instance.transitionDuration,
//       'hover': instance.hover,
//     };

// CommonGradientStop _$CommonGradientStopFromJson(Map<String, dynamic> json) =>
//     CommonGradientStop(
//       color: json['color'] as String,
//       position: (json['position'] as num).toDouble(),
//     );

// Map<String, dynamic> _$CommonGradientStopToJson(CommonGradientStop instance) =>
//     <String, dynamic>{
//       'color': instance.color,
//       'position': instance.position,
//     };

// CommonGradientOverlay _$CommonGradientOverlayFromJson(
//         Map<String, dynamic> json) =>
//     CommonGradientOverlay(
//       enabled: json['enabled'] as bool,
//       stops: (json['stops'] as List<dynamic>)
//           .map((e) => CommonGradientStop.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       angle: (json['angle'] as num).toInt(),
//     );

// Map<String, dynamic> _$CommonGradientOverlayToJson(
//         CommonGradientOverlay instance) =>
//     <String, dynamic>{
//       'enabled': instance.enabled,
//       'stops': instance.stops,
//       'angle': instance.angle,
//     };

// CommonStyle _$CommonStyleFromJson(Map<String, dynamic> json) => CommonStyle(
//       gradientOverlay: CommonGradientOverlay.fromJson(
//           json['gradient_overlay'] as Map<String, dynamic>),
//       animations:
//           CommonAnimations.fromJson(json['animations'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$CommonStyleToJson(CommonStyle instance) =>
//     <String, dynamic>{
//       'gradient_overlay': instance.gradientOverlay,
//       'animations': instance.animations,
//     };

// ElementStyle _$ElementStyleFromJson(Map<String, dynamic> json) => ElementStyle(
//       typography: ElementTypography.fromJson(
//           json['typography'] as Map<String, dynamic>),
//       colors:
//           ElementStyleColors.fromJson(json['colors'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$ElementStyleToJson(ElementStyle instance) =>
//     <String, dynamic>{
//       'typography': instance.typography,
//       'colors': instance.colors,
//     };

// ElementStyleColors _$ElementStyleColorsFromJson(Map<String, dynamic> json) =>
//     ElementStyleColors(
//       text: json['text'] as String,
//       shadow: ElementShadow.fromJson(json['shadow'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$ElementStyleColorsToJson(ElementStyleColors instance) =>
//     <String, dynamic>{
//       'text': instance.text,
//       'shadow': instance.shadow,
//     };

// ElementShadow _$ElementShadowFromJson(Map<String, dynamic> json) =>
//     ElementShadow(
//       color: json['color'] as String,
//       offset: ShadowOffset.fromJson(json['offset'] as Map<String, dynamic>),
//       blurRadius: (json['blur_radius'] as num).toDouble(),
//       opacity: (json['opacity'] as num).toDouble(),
//     );

// Map<String, dynamic> _$ElementShadowToJson(ElementShadow instance) =>
//     <String, dynamic>{
//       'color': instance.color,
//       'offset': instance.offset,
//       'blur_radius': instance.blurRadius,
//       'opacity': instance.opacity,
//     };

// ShadowOffset _$ShadowOffsetFromJson(Map<String, dynamic> json) => ShadowOffset(
//       x: (json['x'] as num).toDouble(),
//       y: (json['y'] as num).toDouble(),
//     );

// Map<String, dynamic> _$ShadowOffsetToJson(ShadowOffset instance) =>
//     <String, dynamic>{
//       'x': instance.x,
//       'y': instance.y,
//     };

// ElementTypography _$ElementTypographyFromJson(Map<String, dynamic> json) =>
//     ElementTypography(
//       fontFamily: json['font_family'] as String,
//       fontSize:
//           ElementFontSize.fromJson(json['font_size'] as Map<String, dynamic>),
//       fontWeight: json['font_weight'] as String,
//       letterSpacing: (json['letter_spacing'] as num).toDouble(),
//       lineHeight: (json['line_height'] as num).toDouble(),
//       textAlign: json['text_align'] as String,
//       textTransform: json['text_transform'] as String,
//     );

// Map<String, dynamic> _$ElementTypographyToJson(ElementTypography instance) =>
//     <String, dynamic>{
//       'font_family': instance.fontFamily,
//       'font_size': instance.fontSize,
//       'font_weight': instance.fontWeight,
//       'letter_spacing': instance.letterSpacing,
//       'line_height': instance.lineHeight,
//       'text_align': instance.textAlign,
//       'text_transform': instance.textTransform,
//     };

// ElementFontSize _$ElementFontSizeFromJson(Map<String, dynamic> json) =>
//     ElementFontSize(
//       base: (json['base'] as num).toDouble(),
//       min: (json['min'] as num).toDouble(),
//       max: (json['max'] as num).toDouble(),
//       scale: (json['scale'] as num).toDouble(),
//     );

// Map<String, dynamic> _$ElementFontSizeToJson(ElementFontSize instance) =>
//     <String, dynamic>{
//       'base': instance.base,
//       'min': instance.min,
//       'max': instance.max,
//       'scale': instance.scale,
//     };

// TemplateMetadata _$TemplateMetadataFromJson(Map<String, dynamic> json) =>
//     TemplateMetadata(
//       isPremium: json['is_premium'] as bool,
//       status: json['status'] as String,
//       version: (json['version'] as num).toInt(),
//     );

// Map<String, dynamic> _$TemplateMetadataToJson(TemplateMetadata instance) =>
//     <String, dynamic>{
//       'is_premium': instance.isPremium,
//       'status': instance.status,
//       'version': instance.version,
//     };

// ResponsiveConfig _$ResponsiveConfigFromJson(Map<String, dynamic> json) =>
//     ResponsiveConfig(
//       gridConfig: GridConfig.fromJson(json['grid'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$ResponsiveConfigToJson(ResponsiveConfig instance) =>
//     <String, dynamic>{
//       'grid': instance.gridConfig,
//     };

// GridConfig _$GridConfigFromJson(Map<String, dynamic> json) => GridConfig(
//       spacing: GridSpacing.fromJson(json['spacing'] as Map<String, dynamic>),
//       columns: GridColumns.fromJson(json['columns'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$GridConfigToJson(GridConfig instance) =>
//     <String, dynamic>{
//       'spacing': instance.spacing,
//       'columns': instance.columns,
//     };

// GridColumns _$GridColumnsFromJson(Map<String, dynamic> json) => GridColumns(
//       small: (json['small'] as num).toInt(),
//       medium: (json['medium'] as num).toInt(),
//       large: (json['large'] as num).toInt(),
//       xlarge: (json['xlarge'] as num).toInt(),
//     );

// Map<String, dynamic> _$GridColumnsToJson(GridColumns instance) =>
//     <String, dynamic>{
//       'small': instance.small,
//       'medium': instance.medium,
//       'large': instance.large,
//       'xlarge': instance.xlarge,
//     };

// GridSpacing _$GridSpacingFromJson(Map<String, dynamic> json) => GridSpacing(
//       small: (json['small'] as num).toDouble(),
//       medium: (json['medium'] as num).toDouble(),
//       large: (json['large'] as num).toDouble(),
//     );

// Map<String, dynamic> _$GridSpacingToJson(GridSpacing instance) =>
//     <String, dynamic>{
//       'small': instance.small,
//       'medium': instance.medium,
//       'large': instance.large,
//     };

// Audit _$AuditFromJson(Map<String, dynamic> json) => Audit(
//       createdAt: DateTime.parse(json['created_at'] as String),
//       createdBy: json['created_by'] as String,
//       modifiedAt: DateTime.parse(json['modified_at'] as String),
//       modifiedBy: json['modified_by'] as String,
//       version: (json['version'] as num).toInt(),
//     );

// Map<String, dynamic> _$AuditToJson(Audit instance) => <String, dynamic>{
//       'created_at': instance.createdAt.toIso8601String(),
//       'created_by': instance.createdBy,
//       'modified_at': instance.modifiedAt.toIso8601String(),
//       'modified_by': instance.modifiedBy,
//       'version': instance.version,
//     };

// Metrics _$MetricsFromJson(Map<String, dynamic> json) => Metrics(
//       views: (json['views'] as num).toInt(),
//       shares: (json['shares'] as num).toInt(),
//       favorites: (json['favorites'] as num).toInt(),
//       lastUsed: json['last_used'] == null
//           ? null
//           : DateTime.parse(json['last_used'] as String),
//     );

// Map<String, dynamic> _$MetricsToJson(Metrics instance) => <String, dynamic>{
//       'views': instance.views,
//       'shares': instance.shares,
//       'favorites': instance.favorites,
//       'last_used': instance.lastUsed?.toIso8601String(),
//     };
