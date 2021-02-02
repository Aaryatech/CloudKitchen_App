// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offersmain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersMain _$OffersMainFromJson(Map<String, dynamic> json) {
  return OffersMain(
    json['info'] == null
        ? null
        : Info.fromJson(json['info'] as Map<String, dynamic>),
    (json['offerList'] as List)
        ?.map((e) =>
            e == null ? null : OfferList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['additionalCharges'] == null
        ? null
        : AdditionalCharges.fromJson(
            json['additionalCharges'] as Map<String, dynamic>),
    json['deliveryCharges'] == null
        ? null
        : DeliveryCharges.fromJson(
            json['deliveryCharges'] as Map<String, dynamic>),
    json['custWalletTotal'] == null
        ? null
        : CustWallet.fromJson(json['custWalletTotal'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OffersMainToJson(OffersMain instance) =>
    <String, dynamic>{
      'info': instance.info,
      'offerList': instance.offerList,
      'additionalCharges': instance.additionalCharges,
      'deliveryCharges': instance.deliveryCharges,
      'custWalletTotal': instance.custWalletTotal,
    };

AdditionalCharges _$AdditionalChargesFromJson(Map<String, dynamic> json) {
  return AdditionalCharges(
    json['chargeId'] as int,
    json['frId'] as int,
    json['exInt1'] as int,
    json['exInt2'] as int,
    json['exInt3'] as int,
    (json['surchargeFee'] as num)?.toDouble(),
    (json['packingChg'] as num)?.toDouble(),
    (json['handlingChg'] as num)?.toDouble(),
    (json['extraChg'] as num)?.toDouble(),
    (json['roundOffAmt'] as num)?.toDouble(),
    (json['exFloat1'] as num)?.toDouble(),
    (json['exFloat2'] as num)?.toDouble(),
    (json['exFloat3'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AdditionalChargesToJson(AdditionalCharges instance) =>
    <String, dynamic>{
      'chargeId': instance.chargeId,
      'frId': instance.frId,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'exInt3': instance.exInt3,
      'surchargeFee': instance.surchargeFee,
      'packingChg': instance.packingChg,
      'handlingChg': instance.handlingChg,
      'extraChg': instance.extraChg,
      'roundOffAmt': instance.roundOffAmt,
      'exFloat1': instance.exFloat1,
      'exFloat2': instance.exFloat2,
      'exFloat3': instance.exFloat3,
    };

DeliveryCharges _$DeliveryChargesFromJson(Map<String, dynamic> json) {
  return DeliveryCharges(
    json['id'] as String,
    (json['amt1'] as num)?.toDouble(),
    (json['amt2'] as num)?.toDouble(),
    (json['minKm'] as num)?.toDouble(),
    (json['maxKm'] as num)?.toDouble(),
    (json['minAmt'] as num)?.toDouble(),
    (json['freeDelvLimit'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$DeliveryChargesToJson(DeliveryCharges instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amt1': instance.amt1,
      'amt2': instance.amt2,
      'minKm': instance.minKm,
      'maxKm': instance.maxKm,
      'minAmt': instance.minAmt,
      'freeDelvLimit': instance.freeDelvLimit,
    };
