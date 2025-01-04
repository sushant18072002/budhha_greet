import 'package:hive/hive.dart';
part 'user_customization.g.dart';

@HiveType(typeId: 9)
class UserCustomization extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String templateId;

  @HiveField(2)
  final String backgroundId;

  @HiveField(3)
  final String? quoteId;

  @HiveField(4)
  final Map<String, dynamic> greetingStyle;

  @HiveField(5)
  final Map<String, dynamic> quoteStyle;

  @HiveField(6)
  final Map<String, String> customGreeting;

  @HiveField(7)
  final DateTime createdAt;

  UserCustomization({
    required this.id,
    required this.templateId,
    required this.backgroundId,
    this.quoteId,
    required this.greetingStyle,
    required this.quoteStyle,
    required this.customGreeting,
    required this.createdAt,
  });

  factory UserCustomization.fromJson(Map<String, dynamic> json) => UserCustomization(
    id: json['id'],
    templateId: json['templateId'],
    backgroundId: json['backgroundId'],
    quoteId: json['quoteId'],
    greetingStyle: json['greetingStyle'],
    quoteStyle: json['quoteStyle'],
    customGreeting: Map<String, String>.from(json['customGreeting']),
    createdAt: DateTime.parse(json['createdAt']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'templateId': templateId,
    'backgroundId': backgroundId,
    'quoteId': quoteId,
    'greetingStyle': greetingStyle,
    'quoteStyle': quoteStyle,
    'customGreeting': customGreeting,
    'createdAt': createdAt.toIso8601String(),
  };
}

@HiveType(typeId: 4)
class TextPosition extends HiveObject {
  @HiveField(0)
  final double x;

  @HiveField(1)
  final double y;

  @HiveField(2)
  final double width;

  @HiveField(3)
  final double height;

  @HiveField(4)
  final double rotation;

  TextPosition({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    this.rotation = 0,
  });

  factory TextPosition.fromJson(Map<String, dynamic> json) => TextPosition(
    x: json['x']?.toDouble() ?? 0.5,
    y: json['y']?.toDouble() ?? 0.5,
    width: json['width']?.toDouble() ?? 0.8,
    height: json['height']?.toDouble() ?? 0.2,
    rotation: json['rotation']?.toDouble() ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'x': x,
    'y': y,
    'width': width,
    'height': height,
    'rotation': rotation,
  };

  dynamic operator [](String key) {
    switch (key) {
      case 'x':
        return x;
      case 'y':
        return y;
      case 'width':
        return width;
      case 'height':
        return height;
      case 'rotation':
        return rotation;
      default:
        throw ArgumentError('Property $key not found in TextPosition');
    }
  }
}

@HiveType(typeId: 5)
class TextPlacementZones extends HiveObject {
  @HiveField(0)
  final Map<String, TextPosition> greeting;

  @HiveField(1)
  final Map<String, TextPosition> quote;

  TextPlacementZones({
    required this.greeting,
    required this.quote,
  });

  // New constructor for single orientation
  factory TextPlacementZones.singleOrientation({
    required TextPosition greetingPosition,
    required TextPosition quotePosition,
    String orientation = 'active',
  }) {
    return TextPlacementZones(
      greeting: {orientation: greetingPosition},
      quote: {orientation: quotePosition},
    );
  }

  // Helper to get positions for specific orientation
  TextPlacementZones getOrientationZones(String orientation) {
    return TextPlacementZones.singleOrientation(
      greetingPosition: greeting[orientation]!,
      quotePosition: quote[orientation]!,
    );
  }

  factory TextPlacementZones.fromJson(Map<String, dynamic> json) => TextPlacementZones(
    greeting: (json['greeting'] as Map<String, dynamic>).map(
      (k, v) => MapEntry(k, TextPosition.fromJson(v)),
    ),
    quote: (json['quote'] as Map<String, dynamic>).map(
      (k, v) => MapEntry(k, TextPosition.fromJson(v)),
    ),
  );

  Map<String, dynamic> toJson() => {
    'greeting': greeting.map((k, v) => MapEntry(k, v.toJson())),
    'quote': quote.map((k, v) => MapEntry(k, v.toJson())),
  };
}

@HiveType(typeId: 6)
class QuoteStyle extends HiveObject {
  @HiveField(0)
  final double x;

  @HiveField(1)
  final double y;

  @HiveField(2)
  final double fontSize;

  @HiveField(3)
  final String fontFamily;

  @HiveField(4)
  final String colorHex;

  @HiveField(5)
  final double rotation;

  @HiveField(6)
  final List<String> effects;

  @HiveField(7)
  final Map<String, TextPosition> positions;

  QuoteStyle({
    required this.x,
    required this.y,
    this.fontSize = 20,
    this.fontFamily = 'Playfair Display',
    this.colorHex = '#FFFFFF',
    this.rotation = 0,
    this.effects = const [],
    this.positions = const {},
  });

  QuoteStyle copyWith({
    double? x,
    double? y,
    double? fontSize,
    String? fontFamily,
    String? colorHex,
    double? rotation,
    List<String>? effects,
    Map<String, TextPosition>? positions,
  }) => QuoteStyle(
    x: x ?? this.x,
    y: y ?? this.y,
    fontSize: fontSize ?? this.fontSize,
    fontFamily: fontFamily ?? this.fontFamily,
    colorHex: colorHex ?? this.colorHex,
    rotation: rotation ?? this.rotation,
    effects: effects ?? this.effects,
    positions: positions ?? this.positions,
  );

  factory QuoteStyle.fromJson(Map<String, dynamic> json) => QuoteStyle(
    x: json['x']?.toDouble() ?? 0.5,
    y: json['y']?.toDouble() ?? 0.5,
    fontSize: json['fontSize']?.toDouble() ?? 20,
    fontFamily: json['fontFamily'] ?? 'Playfair Display',
    colorHex: json['colorHex'] ?? '#FFFFFF',
    rotation: json['rotation']?.toDouble() ?? 0,
    effects: List<String>.from(json['effects'] ?? []),
    positions: (json['positions'] as Map<String, dynamic>? ?? {}).map(
      (k, v) => MapEntry(k, TextPosition.fromJson(v)),
    ),
  );

  Map<String, dynamic> toJson() => {
    'x': x,
    'y': y,
    'fontSize': fontSize,
    'fontFamily': fontFamily,
    'colorHex': colorHex,
    'rotation': rotation,
    'effects': effects,
    'positions': positions.map((k, v) => MapEntry(k, v.toJson())),
  };
}

