// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OfferData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferData _$OfferDataFromJson(Map<String, dynamic> json) {
  return OfferData(
    offerDetailId: json['offerDetailId'] as int,
    offerId: json['offerId'] as int,
    offerSubType: json['offerSubType'] as int,
    primaryItemId: json['primaryItemId'] as int,
    primaryQty: json['primaryQty'] as String,
    discPer: json['discPer'] as String,
    offerLimit: json['offerLimit'] as String,
    couponCode: json['couponCode'] as String,
    secondaryItemId: json['secondaryItemId'] as int,
    secondaryQty: json['secondaryQty'] as String,
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
  );
}

Map<String, dynamic> _$OfferDataToJson(OfferData instance) => <String, dynamic>{
      'offerDetailId': instance.offerDetailId,
      'offerId': instance.offerId,
      'offerSubType': instance.offerSubType,
      'primaryItemId': instance.primaryItemId,
      'secondaryItemId': instance.secondaryItemId,
      'isActive': instance.isActive,
      'delStatus': instance.delStatus,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'exInt3': instance.exInt3,
      'exInt4': instance.exInt4,
      'primaryQty': instance.primaryQty,
      'discPer': instance.discPer,
      'offerLimit': instance.offerLimit,
      'couponCode': instance.couponCode,
      'secondaryQty': instance.secondaryQty,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
      'exVar3': instance.exVar3,
      'exVar4': instance.exVar4,
      'exFloat1': instance.exFloat1,
      'exFloat2': instance.exFloat2,
      'exFloat3': instance.exFloat3,
      'exFloat4': instance.exFloat4,
    };
