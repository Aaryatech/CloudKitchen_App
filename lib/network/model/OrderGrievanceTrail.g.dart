// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderGrievanceTrail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderGrievanceTrail _$OrderGrievanceTrailFromJson(Map<String, dynamic> json) {
  return OrderGrievanceTrail(
    trailId: json['trailId'] as int,
    grievencesId: json['grievencesId'] as int,
    remark: json['remark'] as String,
    status: json['status'] as int,
    actionByUserId: json['actionByUserId'] as int,
    actionDateTime: json['actionDateTime'] as String,
    extraInt1: json['extraInt1'] as int,
    extraInt2: json['extraInt2'] as int,
    extraVar1: json['extraVar1'] as String,
    extraVar2: json['extraVar2'] as int,
    identifiedRootCause: json['identifiedRootCause'] as int,
    grievenceResType: json['grievenceResType'] as int,
    resolutionDetail: json['resolutionDetail'] as int,
    repayAmt: json['repayAmt'] as int,
    repayDetails: json['repayDetails'] as int,
  );
}

Map<String, dynamic> _$OrderGrievanceTrailToJson(
        OrderGrievanceTrail instance) =>
    <String, dynamic>{
      'trailId': instance.trailId,
      'grievencesId': instance.grievencesId,
      'status': instance.status,
      'actionByUserId': instance.actionByUserId,
      'extraInt1': instance.extraInt1,
      'extraInt2': instance.extraInt2,
      'extraVar2': instance.extraVar2,
      'identifiedRootCause': instance.identifiedRootCause,
      'grievenceResType': instance.grievenceResType,
      'resolutionDetail': instance.resolutionDetail,
      'repayAmt': instance.repayAmt,
      'repayDetails': instance.repayDetails,
      'remark': instance.remark,
      'actionDateTime': instance.actionDateTime,
      'extraVar1': instance.extraVar1,
    };
