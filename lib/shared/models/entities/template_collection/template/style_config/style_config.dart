import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'action_buttons/action_buttons.dart';
import 'common_style/common_style.dart';
import 'element_style/element_style.dart';

export 'action_buttons/action_buttons.dart';
export 'common_style/common_style.dart';
export 'element_style/element_style.dart';

part 'style_config.g.dart';

@HiveType(typeId: 38)
@JsonSerializable()
class StyleConfig {
  @HiveField(0)
  @JsonKey(name: 'common')
  final CommonStyle? common;
  
  @HiveField(1)
  @JsonKey(name: 'title')
  final ElementStyle? title;
  
  @HiveField(2)
  @JsonKey(name: 'quote')
  final ElementStyle? quote;
  
  @HiveField(3)
  @JsonKey(name: 'action_buttons')
  final ActionButtons? actionButtons;

  StyleConfig({
    required this.common,
    required this.title,
    required this.quote,
    required this.actionButtons,
  });

  factory StyleConfig.fromJson(Map<String, dynamic> json) => _$StyleConfigFromJson(json);
  Map<String, dynamic> toJson() => _$StyleConfigToJson(this);
}
