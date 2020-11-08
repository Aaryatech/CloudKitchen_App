// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CustomerAddress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerAddressMain _$CustomerAddressMainFromJson(Map<String, dynamic> json) {
  return CustomerAddressMain(
    (json['addressList'] as List)
        ?.map((e) => e == null
            ? null
            : CustomerAddress.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CustomerAddressMainToJson(
        CustomerAddressMain instance) =>
    <String, dynamic>{
      'addressList': instance.addressList,
    };

CustomerAddress _$CustomerAddressFromJson(Map<String, dynamic> json) {
  return CustomerAddress(
    custAddressId: json['custAddressId'] as int,
    custId: json['custId'] as int,
    addressCaption: json['addressCaption'] as String,
    address: json['address'] as String,
    areaId: json['areaId'] as int,
    area: json['area'] as String,
    landmark: json['landmark'] as String,
    pincode: json['pincode'] as String,
    cityId: json['cityId'] as int,
    delStatus: json['delStatus'] as int,
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exInt3: json['exInt3'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
    exVar3: json['exVar3'] as String,
    exFloat1: (json['exFloat1'] as num)?.toDouble(),
    exFloat2: (json['exFloat2'] as num)?.toDouble(),
    exFloat3: (json['exFloat3'] as num)?.toDouble(),
    areaName: json['areaName'] as String,
    cityName: json['cityName'] as String,
  );
}

Map<String, dynamic> _$CustomerAddressToJson(CustomerAddress instance) =>
    <String, dynamic>{
      'custAddressId': instance.custAddressId,
      'custId': instance.custId,
      'areaId': instance.areaId,
      'cityId': instance.cityId,
      'delStatus': instance.delStatus,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'exInt3': instance.exInt3,
      'exFloat1': instance.exFloat1,
      'exFloat2': instance.exFloat2,
      'exFloat3': instance.exFloat3,
      'addressCaption': instance.addressCaption,
      'address': instance.address,
      'area': instance.area,
      'landmark': instance.landmark,
      'pincode': instance.pincode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
      'exVar3': instance.exVar3,
      'areaName': instance.areaName,
      'cityName': instance.cityName,
    };
