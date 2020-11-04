// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OfferList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferList _$OfferListFromJson(Map<String, dynamic> json) {
  return OfferList(
    offerName: json['offerName'] as String,
    offerDesc: json['offerDesc'] as String,
    type: json['type'] as int,
    applicableFor: json['applicableFor'] as String,
    offerType: json['offerType'] as int,
    frequencyType: json['frequencyType'] as int,
    frequency: json['frequency'] as String,
    fromDate: json['fromDate'] as String,
    toDate: json['toDate'] as String,
    fromTime: json['fromTime'] as String,
    toTime: json['toTime'] as String,
    makerUserId: json['makerUserId'] as int,
    makerDatetime: json['makerDatetime'] as String,
    lastUpdatedDatetime: json['lastUpdatedDatetime'] as String,
    compId: json['compId'] as int,
    isActive: json['isActive'] as int,
    delStatus: json['delStatus'] as int,
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exInt3: json['exInt3'] as int,
    exInt4: json['exInt4'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
    exVar3: json['exVar3'] as String,
    exVar4: json['exVar4'] as String,
    exFloat1: (json['exFloat1'] as num)?.toDouble(),
    exFloat2: (json['exFloat2'] as num)?.toDouble(),
    exFloat3: (json['exFloat3'] as num)?.toDouble(),
    exFloat4: (json['exFloat4'] as num)?.toDouble(),
    imageList: (json['imageList'] as List)
        ?.map((e) =>
            e == null ? null : Images.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    offerDetailList: (json['offerDetailList'] as List)
        ?.map((e) =>
            e == null ? null : OfferData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..offerId = json['offerId'] as int;
}

Map<String, dynamic> _$OfferListToJson(OfferList instance) => <String, dynamic>{
      'offerId': instance.offerId,
      'type': instance.type,
      'offerType': instance.offerType,
      'frequencyType': instance.frequencyType,
      'makerUserId': instance.makerUserId,
      'compId': instance.compId,
      'isActive': instance.isActive,
      'delStatus': instance.delStatus,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'exInt3': instance.exInt3,
      'exInt4': instance.exInt4,
      'offerName': instance.offerName,
      'offerDesc': instance.offerDesc,
      'applicableFor': instance.applicableFor,
      'frequency': instance.frequency,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'fromTime': instance.fromTime,
      'toTime': instance.toTime,
      'makerDatetime': instance.makerDatetime,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
      'lastUpdatedDatetime': instance.lastUpdatedDatetime,
      'exVar3': instance.exVar3,
      'exVar4': instance.exVar4,
      'exFloat1': instance.exFloat1,
      'exFloat2': instance.exFloat2,
      'exFloat3': instance.exFloat3,
      'exFloat4': instance.exFloat4,
      'imageList': instance.imageList,
      'offerDetailList': instance.offerDetailList,
    };
