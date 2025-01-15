import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background_attribution.g.dart';


@HiveType(typeId: 26)
@JsonSerializable()
class BackgroundAttribution {
  @HiveField(0)
   @JsonKey(name: 'photographer')
  final String? photographer;
  
  @HiveField(1)
   @JsonKey(name: 'license')
  final String license;
  
  @HiveField(2)
   @JsonKey(name: 'url')
  final String url;

  BackgroundAttribution({
    this.photographer,
    
    required this.license,
    required this.url,
  });

  factory BackgroundAttribution.fromJson(Map<String, dynamic> json) => 
    _$BackgroundAttributionFromJson(json);
  
  Map<String, dynamic> toJson() => _$BackgroundAttributionToJson(this);
}

