
import 'package:cloud_kitchen/network/model/response/ImageList.dart';
import 'package:cloud_kitchen/network/model/response/OfferList.dart';
import 'package:cloud_kitchen/network/model/response/RelItemList.dart';
import 'package:cloud_kitchen/network/model/response/TasteList.dart';
import 'package:json_annotation/json_annotation.dart';
part 'FrequentlyOrder.g.dart';

@JsonSerializable(nullable: false)
class FrequentlyOrder{

   int itemId,catId,subCatId,itemSortId,isDecimal,uomId,productType,productCategory,showInOrder,rating,rateAmt,
   mrpAmt,spRateAmt,cgstPer,sgstPer,igstPer,discPer,mrpDiscAmt,spDiscAmt,freqOrderedQty,isAvailable;
  String itemName,catName,subCatName,itemUom,itemDesc,productStatus,productCategoryName,preperationTime,tagIds,
  tasteTypeIds,tagName,tasteName,hsncd,relItemIds,offerIds,jsonStr,tagList;
  List<TasteList> tasteList;
  List<ImageList> imageList;
  List<RelItemList> relItemList;
  List<OfferList> offerList;

  FrequentlyOrder(
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

 factory FrequentlyOrder.fromJson(Map<String, dynamic> json) => _$FrequentlyOrderFromJson(json);

  
  Map<String, dynamic> toJson() => _$FrequentlyOrderToJson(this);
}