// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImageList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageList _$ImageListFromJson(Map<String, dynamic> json) {
  return ImageList(
    imagesId: json['imagesId'] as int,
    docType: json['docType'] as int,
    docId: json['docId'] as int,
    imageName: json['imageName'] as String,
    seqNo: json['seqNo'] as int,
    isActive: json['isActive'] as int,
    delStatus: json['delStatus'] as int,
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exInt3: json['exInt3'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
    exVar3: json['exVar3'] as String,
    exVar4: json['exVar4'] as String,
    exFloat1: json['exFloat1'] as String,
    exFloat2: json['exFloat2'] as String,
    exFloat3: json['exFloat3'] as String,
  );
}

Map<String, dynamic> _$ImageListToJson(ImageList instance) => <String, dynamic>{
      'imagesId': instance.imagesId,
      'docType': instance.docType,
      'docId': instance.docId,
      'seqNo': instance.seqNo,
      'isActive': instance.isActive,
      'delStatus': instance.delStatus,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'exInt3': instance.exInt3,
      'imageName': instance.imageName,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
      'exVar3': instance.exVar3,
      'exVar4': instance.exVar4,
      'exFloat1': instance.exFloat1,
      'exFloat2': instance.exFloat2,
      'exFloat3': instance.exFloat3,
    };
