// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeliveryInstruction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryInstructionMain _$DeliveryInstructionMainFromJson(
    Map<String, dynamic> json) {
  return DeliveryInstructionMain(
    (json['deliveryInstruction'] as List)
        ?.map((e) => e == null
            ? null
            : DeliveryInstruction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DeliveryInstructionMainToJson(
        DeliveryInstructionMain instance) =>
    <String, dynamic>{
      'deliveryInstruction': instance.deliveryInstruction,
    };

DeliveryInstruction _$DeliveryInstructionFromJson(Map<String, dynamic> json) {
  return DeliveryInstruction(
    instruId: json['instruId'] as int,
    description: json['description'] as String,
    instructnCaption: json['instructnCaption'] as String,
    delStatus: json['delStatus'] as int,
    isActive: json['isActive'] as int,
    companyId: json['companyId'] as int,
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
  );
}

Map<String, dynamic> _$DeliveryInstructionToJson(
        DeliveryInstruction instance) =>
    <String, dynamic>{
      'instruId': instance.instruId,
      'delStatus': instance.delStatus,
      'isActive': instance.isActive,
      'companyId': instance.companyId,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'description': instance.description,
      'instructnCaption': instance.instructnCaption,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
    };
