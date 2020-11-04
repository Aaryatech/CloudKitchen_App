
import 'package:cloud_kitchen/network/model/response/ImageList.dart';
import 'package:json_annotation/json_annotation.dart';
part 'RelItemList.g.dart';

@JsonSerializable(nullable: true)
class RelItemList {

    int itemId,catId,subCatId,isDecimal,uomId,productType,productCategory,showInOrder,isAvailable;
  String itemName,catName,subCatName,itemUom,itemDesc,productStatus,productCategoryName,preperationTime,tagIds,tasteTypeIds,
  tagName,tasteName,hsncd,relItemIds,offerIds,jsonStr,tagList,tasteList,relItemList,offerList;
  double cgstPer,sgstPer,itemSortId,rating,rateAmt,
      mrpAmt,spRateAmt,igstPer,discPer,mrpDiscAmt,spDiscAmt,freqOrderedQty;
 
  List<ImageList> imageList;
  

  RelItemList (
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
   
  factory RelItemList.fromJson(Map<String, dynamic> json) => _$RelItemListFromJson(json);
   
     
     Map<String, dynamic> toJson() => _$RelItemListToJson(this);
}