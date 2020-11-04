// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) {
  return CategoryData(
    catId: json['catId'] as int,
    catName: json['catName'] as String,
    imageList: (json['imageList'] as List)
        ?.map((e) =>
            e == null ? null : ImageList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'catId': instance.catId,
      'catName': instance.catName,
      'imageList': instance.imageList,
    };
