// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrailList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrailList _$TrailListFromJson(Map<String, dynamic> json) {
  return TrailList(
    trailId: json['trailId'] as int,
    orderId: json['orderId'] as int,
    actionByUserId: json['actionByUserId'] as int,
    actionDateTime: json['actionDateTime'] as String,
    status: json['status'] as int,
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exInt3: json['exInt3'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
    exVar3: json['exVar3'] as String,
    actionUserName: json['actionUserName'] as String,
  );
}

Map<String, dynamic> _$TrailListToJson(TrailList instance) => <String, dynamic>{
      'trailId': instance.trailId,
      'orderId': instance.orderId,
      'actionByUserId': instance.actionByUserId,
      'status': instance.status,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'exInt3': instance.exInt3,
      'actionDateTime': instance.actionDateTime,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
      'exVar3': instance.exVar3,
      'actionUserName': instance.actionUserName,
    };
