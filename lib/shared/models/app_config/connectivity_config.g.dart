// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConnectivityConfigAdapter extends TypeAdapter<ConnectivityConfig> {
  @override
  final int typeId = 51;

  @override
  ConnectivityConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConnectivityConfig(
      offlineSupport: fields[0] as bool,
      syncIntervalSeconds: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ConnectivityConfig obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.offlineSupport)
      ..writeByte(1)
      ..write(obj.syncIntervalSeconds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectivityConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectivityConfig _$ConnectivityConfigFromJson(Map<String, dynamic> json) =>
    ConnectivityConfig(
      offlineSupport: json['offlineSupport'] as bool,
      syncIntervalSeconds: (json['syncIntervalSeconds'] as num).toInt(),
    );

Map<String, dynamic> _$ConnectivityConfigToJson(ConnectivityConfig instance) =>
    <String, dynamic>{
      'offlineSupport': instance.offlineSupport,
      'syncIntervalSeconds': instance.syncIntervalSeconds,
    };
