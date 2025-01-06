@HiveType(typeId: 2)
class Source extends HiveObject {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final Map<String, String> title;

  @HiveField(2)
  final String reference;

  @HiveField(3)
  final String type;

  Source({
    required this.uuid,
    required this.title,
    required this.reference,
    required this.type,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        uuid: json['uuid'],
        title: Map<String, String>.from(json['title']),
        reference: json['reference'],
        type: json['type'],
      );
}

@HiveType(typeId: 3)
class QuoteStyle extends HiveObject {
  @HiveField(0)
  final Typography typography;

  @HiveField(1)
  final StyleColors colors;

  @HiveField(2)
  final Effects effects;

  QuoteStyle({
    required this.typography,
    required this.colors,
    required this.effects,
  });

  factory QuoteStyle.fromJson(Map<String, dynamic> json) => QuoteStyle(
        typography: Typography.fromJson(json['typography']),
        colors: StyleColors.fromJson(json['colors']),
        effects: Effects.fromJson(json['effects']),
      );
}

@HiveType(typeId: 4)
class Typography extends HiveObject {
  @HiveField(0)
  final String fontFamily;

  @HiveField(1)
  final FontSize fontSize;

  @HiveField(2)
  final String fontWeight;

  @HiveField(3)
  final double letterSpacing;

  @HiveField(4)
  final double lineHeight;

  @HiveField(5)
  final String textAlign;

  Typography({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.letterSpacing,
    required this.lineHeight,
    required this.textAlign,
  });

  factory Typography.fromJson(Map<String, dynamic> json) => Typography(
        fontFamily: json['fontFamily'],
        fontSize: FontSize.fromJson(json['fontSize']),
        fontWeight: json['fontWeight'],
        letterSpacing: json['letterSpacing'].toDouble(),
        lineHeight: json['lineHeight'].toDouble(),
        textAlign: json['textAlign'],
      );
}

@HiveType(typeId: 5)
class FontSize extends HiveObject {
  @HiveField(0)
  final int base;

  @HiveField(1)
  final int min;

  @HiveField(2)
  final int max;

  @HiveField(3)
  final double scale;

  FontSize({
    required this.base,
    required this.min,
    required this.max,
    required this.scale,
  });

  factory FontSize.fromJson(Map<String, dynamic> json) => FontSize(
        base: json['base'],
        min: json['min'],
        max: json['max'],
        scale: json['scale'].toDouble(),
      );
}

@HiveType(typeId: 6)
class StyleColors extends HiveObject {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final String shadow;

  StyleColors({
    required this.text,
    required this.shadow,
  });

  factory StyleColors.fromJson(Map<String, dynamic> json) => StyleColors(
        text: json['text'],
        shadow: json['shadow'],
      );
}

@HiveType(typeId: 7)
class Effects extends HiveObject {
  @HiveField(0)
  final Shadow shadow;

  Effects({
    required this.shadow,
  });

  factory Effects.fromJson(Map<String, dynamic> json) => Effects(
        shadow: Shadow.fromJson(json['shadow']),
      );
}

@HiveType(typeId: 8)
class Shadow extends HiveObject {
  @HiveField(0)
  final String color;

  @HiveField(1)
  final Offset offset;

  @HiveField(2)
  final int blurRadius;

  Shadow({
    required this.color,
    required this.offset,
    required this.blurRadius,
  });

  factory Shadow.fromJson(Map<String, dynamic> json) => Shadow(
        color: json['color'],
        offset: Offset.fromJson(json['offset']),
        blurRadius: json['blurRadius'],
      );
}

@HiveType(typeId: 9)
class Offset extends HiveObject {
  @HiveField(0)
  final int dx;

  @HiveField(1)
  final int dy;

  Offset({
    required this.dx,
    required this.dy,
  });

  factory Offset.fromJson(Map<String, dynamic> json) => Offset(
        dx: json['dx'],
        dy: json['dy'],
      );
}

@HiveType(typeId: 10)
class QuoteLocalization extends HiveObject {
  @HiveField(0)
  final String originalLanguage;

  @HiveField(1)
  final List<String> availableLanguages;

  @HiveField(2)
  final bool rtlSupport;

  QuoteLocalization({
    required this.originalLanguage,
    required this.availableLanguages,
    required this.rtlSupport,
  });

  factory QuoteLocalization.fromJson(Map<String, dynamic> json) =>
      QuoteLocalization(
        originalLanguage: json['originalLanguage'],
        availableLanguages: List<String>.from(json['availableLanguages']),
        rtlSupport: json['rtlSupport'],
      );
}

@HiveType(typeId: 11)
class QuoteAccessibility extends HiveObject {
  @HiveField(0)
  final Map<String, String> semanticLabel;

  QuoteAccessibility({
    required this.semanticLabel,
  });

  factory QuoteAccessibility.fromJson(Map<String, dynamic> json) =>
      QuoteAccessibility(
        semanticLabel: Map<String, String>.from(json['semanticLabel']),
      );
}

@HiveType(typeId: 12)
class QuoteModeration extends HiveObject {
  @HiveField(0)
  final String status;

  @HiveField(1)
  final DateTime reviewedAt;

  @HiveField(2)
  final String reviewedBy;

  QuoteModeration({
    required this.status,
    required this.reviewedAt,
    required this.reviewedBy,
  });

  factory QuoteModeration.fromJson(Map<String, dynamic> json) => QuoteModeration(
        status: json['status'],
        reviewedAt: DateTime.parse(json['reviewedAt']),
        reviewedBy: json['reviewedBy'],
      );
}

@HiveType(typeId: 13)
class QuoteMetrics extends HiveObject {
  @HiveField(0)
  final int views;

  @HiveField(1)
  final int shares;

  @HiveField(2)
  final int favorites;

  @HiveField(3)
  final DateTime? lastInteraction;

  QuoteMetrics({
    required this.views,
    required this.shares,
    required this.favorites,
    this.lastInteraction,
  });

  factory QuoteMetrics.fromJson(Map<String, dynamic> json) => QuoteMetrics(
        views: json['views'],
        shares: json['shares'],
        favorites: json['favorites'],
        lastInteraction: json['lastInteraction'] != null
            ? DateTime.parse(json['lastInteraction'])
            : null,
      );
}

@HiveType(typeId: 14)
class AuditInfo extends HiveObject {
  @HiveField(0)
  final DateTime createdAt;

  @HiveField(1)
  final String createdBy;

  @HiveField(2)
  final DateTime lastModifiedAt;

  @HiveField(3)
  final String lastModifiedBy;

  @HiveField(4)
  final int version;

  @HiveField(5)
  final List<dynamic> changes;

  AuditInfo({
    required this.createdAt,
    required this.createdBy,
    required this.lastModifiedAt,
    required this.lastModifiedBy,
    required this.version,
    required this.changes,
  });

  factory AuditInfo.fromJson(Map<String, dynamic> json) => AuditInfo(
        createdAt: DateTime.parse(json['createdAt']),
        createdBy: json['createdBy'],
        lastModifiedAt: DateTime.parse(json['lastModifiedAt']),
        lastModifiedBy: json['lastModifiedBy'],
        version: json['version'],
        changes: List<dynamic>.from(json['changes']),
      );
}
