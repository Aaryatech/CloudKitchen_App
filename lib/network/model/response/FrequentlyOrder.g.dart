// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FrequentlyOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FrequentlyOrder _$FrequentlyOrderFromJson(Map<String, dynamic> json) {
  return FrequentlyOrder(
    itemId: json['itemId'] as int,
    itemName: json['itemName'] as String,
    catId: json['catId'] as int,
    catName: json['catName'] as String,
    subCatId: json['subCatId'] as int,
    subCatName: json['subCatName'] as String,
    itemSortId: json['itemSortId'] as int,
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
    rating: json['rating'] as int,
    tagIds: json['tagIds'] as String,
    tasteTypeIds: json['tasteTypeIds'] as String,
    tagName: json['tagName'] as String,
    tasteName: json['tasteName'] as String,
    rateAmt: json['rateAmt'] as int,
    mrpAmt: json['mrpAmt'] as int,
    spRateAmt: json['spRateAmt'] as int,
    cgstPer: json['cgstPer'] as int,
    sgstPer: json['sgstPer'] as int,
    igstPer: json['igstPer'] as int,
    hsncd: json['hsncd'] as String,
    relItemIds: json['relItemIds'] as String,
    discPer: json['discPer'] as int,
    mrpDiscAmt: json['mrpDiscAmt'] as int,
    spDiscAmt: json['spDiscAmt'] as int,
    offerIds: json['offerIds'] as String,
    freqOrderedQty: json['freqOrderedQty'] as int,
    isAvailable: json['isAvailable'] as int,
    jsonStr: json['jsonStr'] as String,
    tagList: json['tagList'] as String,
    tasteList: (json['tasteList'] as List)
        .map((e) => TasteList.fromJson(e as Map<String, dynamic>))
        .toList(),
    imageList: (json['imageList'] as List)
        .map((e) => ImageList.fromJson(e as Map<String, dynamic>))
        .toList(),
    relItemList: (json['relItemList'] as List)
        .map((e) => RelItemList.fromJson(e as Map<String, dynamic>))
        .toList(),
    offerList: (json['offerList'] as List)
        .map((e) => OfferList.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FrequentlyOrderToJson(FrequentlyOrder instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'catId': instance.catId,
      'subCatId': instance.subCatId,
      'itemSortId': instance.itemSortId,
      'isDecimal': instance.isDecimal,
      'uomId': instance.uomId,
      'productType': instance.productType,
      'productCategory': instance.productCategory,
      'showInOrder': instance.showInOrder,
      'rating': instance.rating,
      'rateAmt': instance.rateAmt,
      'mrpAmt': instance.mrpAmt,
      'spRateAmt': instance.spRateAmt,
      'cgstPer': instance.cgstPer,
      'sgstPer': instance.sgstPer,
      'igstPer': instance.igstPer,
      'discPer': instance.discPer,
      'mrpDiscAmt': instance.mrpDiscAmt,
      'spDiscAmt': instance.spDiscAmt,
      'freqOrderedQty': instance.freqOrderedQty,
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
      'imageList': instance.imageList,
      'relItemList': instance.relItemList,
      'offerList': instance.offerList,
    };
