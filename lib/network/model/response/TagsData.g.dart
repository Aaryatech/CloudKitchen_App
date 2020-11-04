// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TagsData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagsData _$TagsDataFromJson(Map<String, dynamic> json) {
  return TagsData(
    tagId: json['tagId'] as int,
    tagName: json['tagName'] as String,
    tagDesc: json['tagDesc'] as String,
    tagIsActive: json['tagIsActive'] as int,
    tagDeleteStatus: json['tagDeleteStatus'] as int,
    tagSortNumber: (json['tagSortNumber'] as num)?.toDouble(),
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
  );
}

Map<String, dynamic> _$TagsDataToJson(TagsData instance) => <String, dynamic>{
      'tagId': instance.tagId,
      'tagIsActive': instance.tagIsActive,
      'tagDeleteStatus': instance.tagDeleteStatus,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'tagName': instance.tagName,
      'tagDesc': instance.tagDesc,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
      'tagSortNumber': instance.tagSortNumber,
    };
