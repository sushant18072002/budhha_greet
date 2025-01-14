import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'action_background/action_background.dart';
import 'action_blur/action_blur.dart';
import 'action_shadow/action_shadow.dart';

export 'action_background/action_background.dart';
export 'action_blur/action_blur.dart';
export 'action_shadow/action_shadow.dart';

part 'action_buttons.g.dart';

@HiveType(typeId: 97)
@JsonSerializable()
class ActionButtons {
  @HiveField(0)
  @JsonKey(name: 'size')
  final double size;
  
  @HiveField(1)
  @JsonKey(name: 'background')
  final ActionBackground background;
  
  @HiveField(2)
  @JsonKey(name: 'blur')
  final ActionBlur blur;
  
  @HiveField(3)
  @JsonKey(name: 'shadow')
  final ActionShadow shadow;

  ActionButtons({
    required this.size,
    required this.background,
    required this.blur,
    required this.shadow,
  });

  factory ActionButtons.fromJson(Map<String, dynamic> json) => _$ActionButtonsFromJson(json);
  Map<String, dynamic> toJson() => _$ActionButtonsToJson(this);
}
