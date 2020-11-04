// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DetailList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailList _$DetailListFromJson(Map<String, dynamic> json) {
  return DetailList(
    orderDetailId: json['orderDetailId'] as int,
    orderId: json['orderId'] as int,
    itemId: json['itemId'] as int,
    hsnCode: json['hsnCode'] as String,
    qty: json['qty'] as int,
    mrp: json['mrp'] as int,
    rate: json['rate'] as int,
    taxableAmt: json['taxableAmt'] as int,
    cgstPer: json['cgstPer'] as int,
    sgstPer: json['sgstPer'] as int,
    igstPer: json['igstPer'] as int,
    cgstAmt: (json['cgstAmt'] as num)?.toDouble(),
    sgstAmt: (json['sgstAmt'] as num)?.toDouble(),
    igstAmt: json['igstAmt'] as int,
    discAmt: json['discAmt'] as int,
    taxAmt: json['taxAmt'] as int,
    totalAmt: json['totalAmt'] as int,
    delStatus: json['delStatus'] as int,
    remark: json['remark'] as String,
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exInt3: json['exInt3'] as int,
    exInt4: json['exInt4'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
    exVar3: json['exVar3'] as String,
    exVar4: json['exVar4'] as String,
    exFloat1: json['exFloat1'] as int,
    exFloat2: json['exFloat2'] as int,
    exFloat3: json['exFloat3'] as int,
    exFloat4: json['exFloat4'] as int,
    itemName: json['itemName'] as String,
  );
}

Map<String, dynamic> _$DetailListToJson(DetailList instance) =>
    <String, dynamic>{
      'orderDetailId': instance.orderDetailId,
      'orderId': instance.orderId,
      'itemId': instance.itemId,
      'qty': instance.qty,
      'mrp': instance.mrp,
      'rate': instance.rate,
      'taxableAmt': instance.taxableAmt,
      'cgstPer': instance.cgstPer,
      'sgstPer': instance.sgstPer,
      'igstPer': instance.igstPer,
      'igstAmt': instance.igstAmt,
      'discAmt': instance.discAmt,
      'taxAmt': instance.taxAmt,
      'totalAmt': instance.totalAmt,
      'delStatus': instance.delStatus,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'exInt3': instance.exInt3,
      'exInt4': instance.exInt4,
      'exFloat1': instance.exFloat1,
      'exFloat2': instance.exFloat2,
      'exFloat3': instance.exFloat3,
      'exFloat4': instance.exFloat4,
      'hsnCode': instance.hsnCode,
      'remark': instance.remark,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
      'exVar3': instance.exVar3,
      'exVar4': instance.exVar4,
      'itemName': instance.itemName,
      'cgstAmt': instance.cgstAmt,
      'sgstAmt': instance.sgstAmt,
    };
