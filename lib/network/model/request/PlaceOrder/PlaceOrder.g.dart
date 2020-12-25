// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlaceOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrder _$PlaceOrderFromJson(Map<String, dynamic> json) {
  return PlaceOrder(
    frId: json['frId'] as int,
    gst: json['gst'] as String,
    custId: json['custId'] as int,
    applicableFor: json['applicableFor'] as int,
    orderStatus: json['orderStatus'] as int,
    payMode: json['payMode'] as int,
    addressId: json['addressId'] as int,
    orderPlatform: json['orderPlatform'] as int,
    offerId: json['offerId'] as int,
    wallet: json['wallet'] as int,
    deliveryType: json['deliveryType'] as int,
    deliveryInstructionId: json['deliveryInstructionId'] as int,
    deliveryDate: json['deliveryDate'] as String,
    deliveryTime: json['deliveryTime'] as String,
    deliveryInstructionText: json['deliveryInstructionText'] as String,
    km: (json['km'] as num)?.toDouble(),
    deliveryCharges: (json['deliveryCharges'] as num)?.toDouble(),
    itemTotal: (json['itemTotal'] as num)?.toDouble(),
    discAmt: (json['discAmt'] as num)?.toDouble(),
    orderDetailParamList: (json['orderDetailParamList'] as List)
        ?.map((e) => e == null
            ? null
            : OrderDetailList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PlaceOrderToJson(PlaceOrder instance) =>
    <String, dynamic>{
      'frId': instance.frId,
      'custId': instance.custId,
      'applicableFor': instance.applicableFor,
      'orderStatus': instance.orderStatus,
      'payMode': instance.payMode,
      'addressId': instance.addressId,
      'orderPlatform': instance.orderPlatform,
      'offerId': instance.offerId,
      'wallet': instance.wallet,
      'deliveryType': instance.deliveryType,
      'deliveryInstructionId': instance.deliveryInstructionId,
      'deliveryDate': instance.deliveryDate,
      'deliveryTime': instance.deliveryTime,
      'deliveryInstructionText': instance.deliveryInstructionText,
      'gst': instance.gst,
      'km': instance.km,
      'deliveryCharges': instance.deliveryCharges,
      'itemTotal': instance.itemTotal,
      'discAmt': instance.discAmt,
      'orderDetailParamList': instance.orderDetailParamList,
    };
