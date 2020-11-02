// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Franchise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Frainchise _$FrainchiseFromJson(Map<String, dynamic> json) {
  return Frainchise(
    frConfigId: json['frConfigId'] as int,
    frId: json['frId'] as int,
    frType: json['frType'] as int,
    frName: json['frName'] as String,
    frCode: json['frCode'] as String,
    frAddress: json['frAddress'] as String,
    frMob: json['frMob'] as String,
    fromLatitude: json['fromLatitude'] as String,
    fromLongitude: json['fromLongitude'] as String,
    toLatitude: json['toLatitude'] as String,
    toLongitude: json['toLongitude'] as String,
    kmAreaCovered: json['kmAreaCovered'] as int,
    compId: json['compId'] as int,
    cityList: json['cityList'] as String,
    areaList: json['areaList'] as String,
    info: Info.fromJson(json['info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FrainchiseToJson(Frainchise instance) =>
    <String, dynamic>{
      'frConfigId': instance.frConfigId,
      'frId': instance.frId,
      'frType': instance.frType,
      'kmAreaCovered': instance.kmAreaCovered,
      'compId': instance.compId,
      'frName': instance.frName,
      'frCode': instance.frCode,
      'frAddress': instance.frAddress,
      'frMob': instance.frMob,
      'fromLatitude': instance.fromLatitude,
      'fromLongitude': instance.fromLongitude,
      'toLatitude': instance.toLatitude,
      'toLongitude': instance.toLongitude,
      'cityList': instance.cityList,
      'areaList': instance.areaList,
      'info': instance.info,
    };
