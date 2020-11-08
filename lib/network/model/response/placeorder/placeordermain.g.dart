// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placeordermain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderModel _$PlaceOrderModelFromJson(Map<String, dynamic> json) {
  return PlaceOrderModel(
    json['orderId'] as int,
    json['uuidNo'] as String,
    (json['amt'] as num)?.toDouble(),
    json['payMode'] as int,
    json['paidStatus'] as int,
    json['orderStatus'] as int,
    json['info'] == null
        ? null
        : Info.fromJson(json['info'] as Map<String, dynamic>),
    json['paymentResponse'] == null
        ? null
        : PaymentResponse.fromJson(
            json['paymentResponse'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaceOrderModelToJson(PlaceOrderModel instance) =>
    <String, dynamic>{
      'uuidNo': instance.uuidNo,
      'amt': instance.amt,
      'orderId': instance.orderId,
      'payMode': instance.payMode,
      'paidStatus': instance.paidStatus,
      'orderStatus': instance.orderStatus,
      'info': instance.info,
      'paymentResponse': instance.paymentResponse,
    };

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) {
  return PaymentResponse(
    json['status'] as String,
    json['message'] as String,
    json['cftoken'] as String,
  );
}

Map<String, dynamic> _$PaymentResponseToJson(PaymentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'cftoken': instance.cftoken,
    };
