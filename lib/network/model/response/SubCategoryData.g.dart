// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubCategoryData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryData _$SubCategoryDataFromJson(Map<String, dynamic> json) {
  return SubCategoryData(
    subCatId: json['subCatId'] as int,
    catId: json['catId'] as int,
    catName: json['catName'] as String,
    subCatName: json['subCatName'] as String,
    imageList: (json['imageList'] as List).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$SubCategoryDataToJson(SubCategoryData instance) =>
    <String, dynamic>{
      'subCatId': instance.subCatId,
      'catId': instance.catId,
      'catName': instance.catName,
      'subCatName': instance.subCatName,
      'imageList': instance.imageList,
    };
