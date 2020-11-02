// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) {
  return Language(
    langId: json['langId'] as int,
    langCode: json['langCode'] as String,
    langName: json['langName'] as String,
    companyId: json['companyId'] as int,
    delStatus: json['delStatus'] as int,
    isActive: json['isActive'] as int,
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
  );
}

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'langId': instance.langId,
      'companyId': instance.companyId,
      'delStatus': instance.delStatus,
      'isActive': instance.isActive,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'langCode': instance.langCode,
      'langName': instance.langName,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
    };
