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
    totalAmt: (json['totalAmt'] as num)?.toDouble(),
    amount: (json['amount'] as num)?.toDouble(),
    walletDate: json['walletDate'] as String,
    transcType: json['transcType'] as String,
    billNo: json['billNo'] as String,
    orderDate: json['orderDate'] as String,
  );
}

Map<String, dynamic> _$MadhviCreditToJson(MadhviCredit instance) =>
    <String, dynamic>{
      'walletId': instance.walletId,
      'orderId': instance.orderId,
      'orderNo': instance.orderNo,
      'orderDate': instance.orderDate,
      'walletDate': instance.walletDate,
      'transcType': instance.transcType,
      'billNo': instance.billNo,
      'totalAmt': instance.totalAmt,
      'amount': instance.amount,
    };

MadhviCreditList _$MadhviCreditListFromJson(Map<String, dynamic> json) {
  return MadhviCreditList(
    walletTransaction: (json['walletTransaction'] as List)
        ?.map((e) =>
            e == null ? null : MadhviCredit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MadhviCreditListToJson(MadhviCreditList instance) =>
    <String, dynamic>{
      'walletTransaction': instance.walletTransaction,
    };
