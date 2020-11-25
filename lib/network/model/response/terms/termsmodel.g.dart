// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'termsmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsModel _$TermsModelFromJson(Map<String, dynamic> json) {
  return TermsModel(
    json['settingKey'] as String,
    json['settingValue1'] as String,
    json['settingValue2'] as String,
    json['exVarchar1'] as String,
    json['exVarchar2'] as String,
    json['exVarchar3'] as String,
    json['delStatus'] as int,
    json['settingId'] as int,
  );
}

Map<String, dynamic> _$TermsModelToJson(TermsModel instance) =>
    <String, dynamic>{
      'settingKey': instance.settingKey,
      'settingValue1': instance.settingValue1,
      'settingValue2': instance.settingValue2,
      'exVarchar1': instance.exVarchar1,
      'exVarchar2': instance.exVarchar2,
      'exVarchar3': instance.exVarchar3,
      'delStatus': instance.delStatus,
      'settingId': instance.settingId,
    };
