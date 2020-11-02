// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'City.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    cityId: json['cityId'] as int,
    cityName: json['cityName'] as String,
    description: json['description'] as String,
    cityCode: json['cityCode'] as String,
    companyId: json['companyId'] as int,
    delStatus: json['delStatus'] as int,
    isActive: json['isActive'] as int,
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'cityId': instance.cityId,
      'companyId': instance.companyId,
      'delStatus': instance.delStatus,
      'isActive': instance.isActive,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'cityName': instance.cityName,
      'description': instance.description,
      'cityCode': instance.cityCode,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
    };
