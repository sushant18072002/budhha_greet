import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../analytics/audit.dart';
import '../../../app_config/cache_config.dart';
import 'background_attribution/background_attribution.dart';
import 'background_optimization/background_optimization.dart';
import 'background_style/background_visual_data/background_visual_data.dart';
import 'background_translation/background_translation.dart';

export '../../../analytics/audit.dart';
export '../../../app_config/cache_config.dart';
export 'background_optimization/background_optimization.dart';
export 'background_style/background_visual_data/background_visual_data.dart';
export 'background_translation/background_translation.dart';
export 'background_attribution/background_attribution.dart';

part 'background.g.dart';

@HiveType(typeId: 9)
@JsonSerializable()
class Background {
  @HiveField(0)
  @JsonKey(name: 'uuid')
  final String uuid;

  @HiveField(1)
  @JsonKey(name: 'id')
  final String id;

  @HiveField(2)
  @JsonKey(name: 'type')
  final String type;

  @HiveField(3)
  @JsonKey(name: 'translations')
  final Map<String, BackGroundTranslation> translations;

  @HiveField(4)
  @JsonKey(name: 'visual_data')
  final BackgroundVisualData visualData;

  @HiveField(5)
  @JsonKey(name: 'visual_effects')
  final BackgroundVisualData visualEffects;

  @HiveField(6)
  @JsonKey(name: 'category_ids')
  final List<String> categoryIds;

  @HiveField(7)
  @JsonKey(name: 'tag_ids')
  final List<String> tagIds;

  @HiveField(8)
  @JsonKey(name: 'attribution')
  final BackgroundAttribution attribution;

  @HiveField(9)
  @JsonKey(name: 'optimization')
  final BackgroundOptimization optimization;

  @HiveField(10)
  @JsonKey(name: 'cache_config')
  final CacheConfig cacheConfig;

  @HiveField(11)
  @JsonKey(name: 'audit')
  final Audit audit;

  Background({
    required this.uuid,
    required this.id,
    required this.type,
    required this.translations,
    required this.visualData,
    required this.visualEffects,
    required this.categoryIds,
    required this.tagIds,
    required this.attribution,
    required this.optimization,
    required this.cacheConfig,
    required this.audit,
  });

  factory Background.fromJson(Map<String, dynamic> json) =>
      _$BackgroundFromJson(json);

  Map<String, dynamic> toJson() => _$BackgroundToJson(this);
}
