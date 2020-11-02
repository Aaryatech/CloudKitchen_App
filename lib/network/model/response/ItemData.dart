import 'package:cloud_kitchen/network/model/response/ImageList.dart';
import 'package:cloud_kitchen/network/model/response/OfferList.dart';
import 'package:cloud_kitchen/network/model/response/RelItemList.dart';
import 'package:cloud_kitchen/network/model/response/TagsData.dart';
import 'package:cloud_kitchen/network/model/response/TasteList.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ItemData.g.dart';

@JsonSerializable(nullable: false)
class ItemData{

  int itemId,catId,subCatId,itemSortId,isDecimal,uomId,productType,productCategory,showInOrder,rating,rateAmt,
  mrpAmt,spRateAmt,igstPer,discPer,mrpDiscAmt,spDiscAmt,freqOrderedQty,isAvailable;
  String itemName,catName,subCatName,itemUom,itemDesc,productStatus,productCategoryName,preperationTime,tagIds,
  tasteTypeIds,tagName,tasteName,hsncd,relItemIds,offerIds,jsonStr;
  double cgstPer,sgstPer;

  List<TagsData> tagList;
  List<TasteList> tasteList;
  List<ImageList> imageList;
  List<RelItemList> relItemList;
  List<OfferList> offerList;

  ItemData(
      {this.itemId,
      this.itemName,
      this.catId,
      this.catName,
      this.subCatId,
      this.subCatName,
      this.itemSortId,
      this.isDecimal,
      this.itemUom,
      this.uomId,
      this.itemDesc,
      this.productType,
      this.productStatus,
      this.productCategory,
      this.productCategoryName,
      this.preperationTime,
      this.showInOrder,
      this.rating,
      this.tagIds,
      this.tasteTypeIds,
      this.tagName,
      this.tasteName,
      this.rateAmt,
      this.mrpAmt,
      this.spRateAmt,
      this.cgstPer,
      this.sgstPer,
      this.igstPer,
      this.hsncd,
      this.relItemIds,
      this.discPer,
      this.mrpDiscAmt,
      this.spDiscAmt,
      this.offerIds,
      this.freqOrderedQty,
      this.isAvailable,
      this.jsonStr,
      this.tagList,
      this.tasteList,
      this.imageList,
      this.relItemList,
      this.offerList});

        factory ItemData.fromJson(Map<String, dynamic> json) => _$ItemDataFromJson(json);

  
  Map<String, dynamic> toJson() => _$ItemDataToJson(this);

}