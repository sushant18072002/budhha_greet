import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'connectivity_config.g.dart';

@HiveType(typeId: 51)
@JsonSerializable()
class ConnectivityConfig {
  @HiveField(0)
  final bool offlineSupport;
  
  @HiveField(1)
  final int syncIntervalSeconds;

  ConnectivityConfig({
    required this.offlineSupport,
    required this.syncIntervalSeconds,
  });

  factory ConnectivityConfig.fromJson(Map<String, dynamic> json) => 
    _$ConnectivityConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$ConnectivityConfigToJson(this);
}
