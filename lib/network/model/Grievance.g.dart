// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Grievance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grievance _$GrievanceFromJson(Map<String, dynamic> json) {
  return Grievance(
    grieveId: json['grieveId'] as int,
    orderId: json['orderId'] as int,
    grievenceTypeId: json['grievenceTypeId'] as int,
    grievenceSubtypeId: json['grievenceSubtypeId'] as int,
    remark: json['remark'] as String,
    currentStatus: json['currentStatus'] as int,
    insertDateTime: json['insertDateTime'] as String,
    insertById: json['insertById'] as int,
    grievenceTypeName: json['grievenceTypeName'] as String,
    grievenceSubtypeName: json['grievenceSubtypeName'] as String,
    date: json['date'] as String,
    extraInt1: json['extraInt1'] as int,
    extraInt2: json['extraInt2'] as int,
    extraVar1: json['extraVar1'] as String,
    extraVar2: json['extraVar2'] as String,
    platform: json['platform'] as int,
    grievencceNo: json['grievencceNo'] as String,
    orderNo: json['orderNo'] as String,
    grvType: json['grvType'] as String,
    grvInstrustion: json['grvInstrustion'] as String,
    getGrievienceTailList: json['getGrievienceTailList'] == null
        ? null
        : OrderGrievanceTrail.fromJson(
            json['getGrievienceTailList'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GrievanceToJson(Grievance instance) => <String, dynamic>{
      'grieveId': instance.grieveId,
      'orderId': instance.orderId,
      'grievenceTypeId': instance.grievenceTypeId,
      'grievenceSubtypeId': instance.grievenceSubtypeId,
      'currentStatus': instance.currentStatus,
      'insertById': instance.insertById,
      'extraInt1': instance.extraInt1,
      'extraInt2': instance.extraInt2,
      'platform': instance.platform,
      'remark': instance.remark,
      'insertDateTime': instance.insertDateTime,
      'grievenceTypeName': instance.grievenceTypeName,
      'grievenceSubtypeName': instance.grievenceSubtypeName,
      'date': instance.date,
      'extraVar1': instance.extraVar1,
      'extraVar2': instance.extraVar2,
      'grievencceNo': instance.grievencceNo,
      'grvType': instance.grvType,
      'grvInstrustion': instance.grvInstrustion,
      'orderNo': instance.orderNo,
      'getGrievienceTailList': instance.getGrievienceTailList,
    };
