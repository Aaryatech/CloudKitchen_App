// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MadhviCredit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MadhviCredit _$MadhviCreditFromJson(Map<String, dynamic> json) {
  return MadhviCredit(
    walletId: json['walletId'] as int,
    orderId: json['orderId'] as int,
    orderNo: json['orderNo'] as String,
    totalAmt: json['totalAmt'] as String,
    amount: json['amount'] as String,
    walletDate: json['walletDate'] as String,
    transcType: json['transcType'] as String,
    billNo: json['billNo'] as String,
  )..orderDate = json['orderDate'] as String;
}

Map<String, dynamic> _$MadhviCreditToJson(MadhviCredit instance) =>
    <String, dynamic>{
      'walletId': instance.walletId,
      'orderId': instance.orderId,
      'orderNo': instance.orderNo,
      'orderDate': instance.orderDate,
      'totalAmt': instance.totalAmt,
      'amount': instance.amount,
      'walletDate': instance.walletDate,
      'transcType': instance.transcType,
      'billNo': instance.billNo,
    };
