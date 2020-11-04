// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TasteList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasteList _$TasteListFromJson(Map<String, dynamic> json) {
  return TasteList(
    ingrediantId: json['ingrediantId'] as int,
    ingrediantCatId: json['ingrediantCatId'] as int,
    ingrediantName: json['ingrediantName'] as String,
    delStatus: json['delStatus'] as int,
    isActive: json['isActive'] as int,
    ingrediantImage: json['ingrediantImage'] as String,
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
    exFloat1: (json['exFloat1'] as num)?.toDouble(),
    exFloat2: (json['exFloat2'] as num)?.toDouble(),
    lastOprationDatetime: json['lastOprationDatetime'] as String,
    ingrediantDesc: json['ingrediantDesc'] as String,
  );
}

Map<String, dynamic> _$TasteListToJson(TasteList instance) => <String, dynamic>{
      'ingrediantId': instance.ingrediantId,
      'ingrediantCatId': instance.ingrediantCatId,
      'delStatus': instance.delStatus,
      'isActive': instance.isActive,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'ingrediantName': instance.ingrediantName,
      'ingrediantImage': instance.ingrediantImage,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
      'lastOprationDatetime': instance.lastOprationDatetime,
      'ingrediantDesc': instance.ingrediantDesc,
      'exFloat1': instance.exFloat1,
      'exFloat2': instance.exFloat2,
    };
