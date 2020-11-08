// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderDetailList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailList _$OrderDetailListFromJson(Map<String, dynamic> json) {
  return OrderDetailList(
    itemId: json['itemId'] as int,
    selectedQty: (json['selectedQty'] as num)?.toDouble(),
    qty: json['qty'] as int,
  );
}

Map<String, dynamic> _$OrderDetailListToJson(OrderDetailList instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'qty': instance.qty,
      'selectedQty': instance.selectedQty,
    };
