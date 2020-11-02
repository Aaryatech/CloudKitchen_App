// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AreaListByCityId.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaListByCityId _$AreaListByCityIdFromJson(Map<String, dynamic> json) {
  return AreaListByCityId(
    areaId: json['areaId'] as int,
    cityId: json['cityId'] as int,
    description: json['description'] as String,
    areaName: json['areaName'] as String,
    areaCode: json['areaCode'] as String,
    pincode: json['pincode'] as String,
    companyId: json['companyId'] as int,
    delStatus: json['delStatus'] as int,
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
    isActive: json['isActive'] as int,
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
  );
}

Map<String, dynamic> _$AreaListByCityIdToJson(AreaListByCityId instance) =>
    <String, dynamic>{
      'areaId': instance.areaId,
      'cityId': instance.cityId,
      'companyId': instance.companyId,
      'delStatus': instance.delStatus,
      'isActive': instance.isActive,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'description': instance.description,
      'areaName': instance.areaName,
      'areaCode': instance.areaCode,
      'pincode': instance.pincode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
    };
