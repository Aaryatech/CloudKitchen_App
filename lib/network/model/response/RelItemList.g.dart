// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RelItemList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelItemList _$RelItemListFromJson(Map<String, dynamic> json) {
  return RelItemList(
    itemId: json['itemId'] as int,
    itemName: json['itemName'] as String,
    catId: json['catId'] as int,
    catName: json['catName'] as String,
    subCatId: json['subCatId'] as int,
    subCatName: json['subCatName'] as String,
    itemSortId: (json['itemSortId'] as num)?.toDouble(),
    isDecimal: json['isDecimal'] as int,
    itemUom: json['itemUom'] as String,
    uomId: json['uomId'] as int,
    itemDesc: json['itemDesc'] as String,
    productType: json['productType'] as int,
    productStatus: json['productStatus'] as String,
    productCategory: json['productCategory'] as int,
    productCategoryName: json['productCategoryName'] as String,
    preperationTime: json['preperationTime'] as String,
    showInOrder: json['showInOrder'] as int,
    rating: (json['rating'] as num)?.toDouble(),
    tagIds: json['tagIds'] as String,
    tasteTypeIds: json['tasteTypeIds'] as String,
    tagName: json['tagName'] as String,
    tasteName: json['tasteName'] as String,
    rateAmt: (json['rateAmt'] as num)?.toDouble(),
    mrpAmt: (json['mrpAmt'] as num)?.toDouble(),
    spRateAmt: (json['spRateAmt'] as num)?.toDouble(),
    cgstPer: (json['cgstPer'] as num)?.toDouble(),
    sgstPer: (json['sgstPer'] as num)?.toDouble(),
    igstPer: (json['igstPer'] as num)?.toDouble(),
    hsncd: json['hsncd'] as String,
    relItemIds: json['relItemIds'] as String,
    discPer: (json['discPer'] as num)?.toDouble(),
    mrpDiscAmt: (json['mrpDiscAmt'] as num)?.toDouble(),
    spDiscAmt: (json['spDiscAmt'] as num)?.toDouble(),
    offerIds: json['offerIds'] as String,
    freqOrderedQty: (json['freqOrderedQty'] as num)?.toDouble(),
    isAvailable: json['isAvailable'] as int,
    jsonStr: json['jsonStr'] as String,
    tagList: json['tagList'] as String,
    tasteList: json['tasteList'] as String,
    imageList: (json['imageList'] as List)
        ?.map((e) =>
            e == null ? null : ImageList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    relItemList: json['relItemList'] as String,
    offerList: json['offerList'] as String,
  );
}

Map<String, dynamic> _$RelItemListToJson(RelItemList instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'catId': instance.catId,
      'subCatId': instance.subCatId,
      'isDecimal': instance.isDecimal,
      'uomId': instance.uomId,
      'productType': instance.productType,
      'productCategory': instance.productCategory,
      'showInOrder': instance.showInOrder,
      'isAvailable': instance.isAvailable,
      'itemName': instance.itemName,
      'catName': instance.catName,
      'subCatName': instance.subCatName,
      'itemUom': instance.itemUom,
      'itemDesc': instance.itemDesc,
      'productStatus': instance.productStatus,
      'productCategoryName': instance.productCategoryName,
      'preperationTime': instance.preperationTime,
      'tagIds': instance.tagIds,
      'tasteTypeIds': instance.tasteTypeIds,
      'tagName': instance.tagName,
      'tasteName': instance.tasteName,
      'hsncd': instance.hsncd,
      'relItemIds': instance.relItemIds,
      'offerIds': instance.offerIds,
      'jsonStr': instance.jsonStr,
      'tagList': instance.tagList,
      'tasteList': instance.tasteList,
      'relItemList': instance.relItemList,
      'offerList': instance.offerList,
      'cgstPer': instance.cgstPer,
      'sgstPer': instance.sgstPer,
      'itemSortId': instance.itemSortId,
      'rating': instance.rating,
      'rateAmt': instance.rateAmt,
      'mrpAmt': instance.mrpAmt,
      'spRateAmt': instance.spRateAmt,
      'igstPer': instance.igstPer,
      'discPer': instance.discPer,
      'mrpDiscAmt': instance.mrpDiscAmt,
      'spDiscAmt': instance.spDiscAmt,
      'freqOrderedQty': instance.freqOrderedQty,
      'imageList': instance.imageList,
    };
