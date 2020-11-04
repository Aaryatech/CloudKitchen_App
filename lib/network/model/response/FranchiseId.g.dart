// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FranchiseId.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FranchiseId _$FranchiseIdFromJson(Map<String, dynamic> json) {
  return FranchiseId(
    info: json['info'] == null
        ? null
        : Info.fromJson(json['info'] as Map<String, dynamic>),
    categoryData: (json['categoryData'] as List)
        ?.map((e) =>
            e == null ? null : CategoryData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subCategoryData: (json['subCategoryData'] as List)
        ?.map((e) => e == null
            ? null
            : SubCategoryData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    offerData: (json['offerData'] as List)
        ?.map((e) =>
            e == null ? null : OfferData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tagsData: (json['tagsData'] as List)
        ?.map((e) =>
            e == null ? null : TagsData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    itemData: (json['itemData'] as List)
        ?.map((e) =>
            e == null ? null : ItemData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FranchiseIdToJson(FranchiseId instance) =>
    <String, dynamic>{
      'info': instance.info,
      'categoryData': instance.categoryData,
      'subCategoryData': instance.subCategoryData,
      'offerData': instance.offerData,
      'tagsData': instance.tagsData,
      'itemData': instance.itemData,
    };
