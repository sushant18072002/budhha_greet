import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'background/background.dart';
import 'blur/blur.dart';
import 'shadow/shadow.dart';

part 'action_buttons.g.dart';

@HiveType(typeId: 97)
@JsonSerializable()
class ActionButtons {
  @HiveField(0)
  @JsonKey(name: 'size')
  final double size;
  
  @HiveField(1)
  @JsonKey(name: 'background')
  final Background background;
  
  @HiveField(2)
  @JsonKey(name: 'blur')
  final Blur blur;
  
  @HiveField(3)
  @JsonKey(name: 'shadow')
  final Shadow shadow;

  ActionButtons({
    required this.size,
    required this.background,
    required this.blur,
    required this.shadow,
  });

  factory ActionButtons.fromJson(Map<String, dynamic> json) => _$ActionButtonsFromJson(json);
  Map<String, dynamic> toJson() => _$ActionButtonsToJson(this);
}
