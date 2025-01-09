import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_item.g.dart';

@HiveType(typeId: 50)
@JsonSerializable()
class PopularItems {
  @HiveField(0)
   @JsonKey(name: 'template_ids')
  final List<String> templateIds;
  
  @HiveField(1)
   @JsonKey(name: 'quote_ids')
  final List<String> quoteIds;
  
  @HiveField(2)
   @JsonKey(name: 'background_ids')
  final List<String> backgroundIds;

  PopularItems({
    required this.templateIds,
    required this.quoteIds,
    required this.backgroundIds,
  });

  factory PopularItems.fromJson(Map<String, dynamic> json) => 
    _$PopularItemsFromJson(json);
  
  Map<String, dynamic> toJson() => _$PopularItemsToJson(this);
}

